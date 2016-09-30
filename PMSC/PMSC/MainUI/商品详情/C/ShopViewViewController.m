//
//  ShopViewViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/31.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopViewViewController.h"
#import "ShopDetailView.h"
#import "AllDuobaoViewController.h"
#import "PayViewController.h"
#import "StoreBaskViewController.h"
#import "NewJiexiaoViewController.h"
#import "LastJiexiaoViewController.h"
#import "PayStyleViewController.h"
#import "ShopCarViewController.h"
#import "AdressViewController.h"
#import "ShopDetailModel.h"
@interface ShopViewViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)ShopDetailView *sdView;
@end

@implementation ShopViewViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title  = @"商品详情";
    self.dataArr = @[@"图文详情",@"往期揭晓",@"晒单分享",@"所有夺宝记录"];
    self.imgArr =@[@"twxq@3x",@"wqjx@3x",@"sdfx@3x_2",@"sydbjl@3x_1"];
    self.sdView = [[ShopDetailView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, 574*kScreenHeight)];
    self.tableView.tableHeaderView =self.sdView;
    [self setupBottomView];
    self.view.backgroundColor = kHexColor(0xeeeeee);
    [self loadShopWithId:self.sId];
    
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    cell.textLabel.textColor = kHexColor(0x000000);
    cell.imageView.image = [UIImage imageNamed:self.imgArr[indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize: 30 *kScreenWidth];
    if(indexPath.row != 3)
    {
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 3) {
        AllDuobaoViewController *allduobao = [AllDuobaoViewController new] ;
        allduobao.dId = self.sId;
    [self.navigationController pushViewController:allduobao animated:YES];
    }
    if (indexPath.row == 2) {
        StoreBaskViewController *sotre =[StoreBaskViewController new];
        sotre.ID =self.sId;
        [self.navigationController pushViewController:sotre animated:YES];
    }
    if (indexPath.row == 1) {
        LastJiexiaoViewController *last = [[LastJiexiaoViewController alloc] init];
        
        last.goodId = self.sId;
        NSLog(@"%@",last.goodId);
        [self.navigationController pushViewController:last animated:YES];

    }
}
-(void)setupBottomView
{
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, 200*kScreenHeight)];
    self.tableView.tableFooterView = foot;
    foot.backgroundColor = kHexColor(0xeeeeee);
    self.rightNowDuobao =[ UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_rightNowDuobao];
    _rightNowDuobao.frame = CGRectMake(0, Screen_HEIGHT - 88*kScreenHeight-64, 252*kScreenWidth, 85*kScreenWidth) ;
    [_rightNowDuobao setImage:[UIImage imageNamed:@"立即夺宝@3x"] forState:0];
    self.addCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_addCarBtn];
    _addCarBtn.frame = CGRectMake(_rightNowDuobao.right-20*kScreenWidth, _rightNowDuobao.top, _rightNowDuobao.width, _rightNowDuobao.height);
    [_addCarBtn setImage:[UIImage imageNamed:@"加入购物车@3x"] forState:0];
    self.shopCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shopCarBtn.frame = CGRectMake(_addCarBtn.right-20*kScreenWidth, _rightNowDuobao.top, _rightNowDuobao.width, _rightNowDuobao.height);
    [self.view addSubview:_shopCarBtn];
    _shopCarBtn.backgroundColor = [UIColor whiteColor];
    [_shopCarBtn setImage:[UIImage imageNamed:@"gwc@3x_1"] forState:0];
    [_rightNowDuobao addTarget:self action:@selector(duobao) forControlEvents:UIControlEventTouchUpInside];
    [_addCarBtn addTarget:self action:@selector(addCar) forControlEvents:UIControlEventTouchUpInside];
    [_shopCarBtn addTarget:self action:@selector(car) forControlEvents:UIControlEventTouchUpInside];

    
}
-(void)loadShopWithId:(NSString *)Id
{

    __weak typeof (ShopViewViewController) *weakself = self;

    [ShopDetailModel setBlockShopDetailWithgid:[Id intValue] WithUID:TOKEN WithBLock:^(id returnValue) {
        weakself.sdView.titleLb = returnValue[@"title"];
        weakself.sdView.detailDic = returnValue;
        NSLog(@"%@",weakself.sdView.detailDic);
    }];
}
-(void)duobao
{
    //立即夺宝
    AdressViewController *adVC = [[AdressViewController alloc] init];
    adVC.name = @"地址选择";
    
    [self.navigationController pushViewController:adVC animated:YES];
}
-(void)addCar
{
    //加入购物车
//    int token = [[NSString stringWithFormat:@"%@",TOKEN] intValue];
//    NSLog(@"%d %@",token,TOKEN);
//    NSLog(@"%dv%@",[self.sId intValue],self.sId);
//   [ShopDetailModel setWithSId:[self.sId intValue] Withnum:1 WithUId:TOKEN WithBlock:^(id returnValue) {
//       NSLog(@"%@",returnValue);
//   }];
   
}
-(void)car
{
    //购物车
    ShopCarViewController *car = [[ShopCarViewController alloc ] initWithNibName:@"ShopCarViewController" bundle:nil];
    [self.navigationController pushViewController:car animated:YES];
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
