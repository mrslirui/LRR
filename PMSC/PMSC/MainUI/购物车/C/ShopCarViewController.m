//
//  ShopCarViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/1.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopCarViewController.h"
#import "ShopCarTableViewCell.h"
#import "AdressViewController.h"
#import "ShopCarModel.h"
@interface ShopCarViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag;
}
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic,retain)NSMutableArray *rowArr1; /*** 加减号数组 */
@property(nonatomic,retain)UIButton *button; //购买删除按钮se
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSMutableArray *selectArr;
@property (nonatomic, strong) NSMutableArray *delegateArray;
@property(nonatomic,retain)UILabel *total;
@property(nonatomic,retain)UILabel *count;
@end

@implementation ShopCarViewController
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
    }
    return _rowArr;
}
-(NSMutableArray *)rowArr1
{
    if(!_rowArr1)
    {
        self.rowArr1 = [NSMutableArray array];
    }
    return _rowArr1;
}
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(NSMutableArray *)selectArr
{
    if (!_selectArr) {
        _selectArr = [NSMutableArray array];
        
    }
    return _selectArr;
}
- (NSMutableArray *)delegateArray
{
    if (!_delegateArray) {
        self.delegateArray = [NSMutableArray array];
    }
    return _delegateArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"购物车";
    [self.tableView registerClass:[ShopCarTableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.backgroundColor =kHexColor(0xeeeeee);
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    [self bottom];
    flag = NO;
    [self loadData];
}
-(void)loadData
{
    [ShopCarModel setWithUid:TOKEN WithBlock:^(id value) {
        self.dataArr = value;
        for (int i = 0; i<_dataArr.count; i++) {
            [self.rowArr addObject:@"0"];
            [self.rowArr1 addObject:@"0"];
            [self.selectArr addObject:@"1"];
        }
        [self.tableView reloadData];
    }];
}
-(void)right
{
    flag = !flag;
    if (flag) {
        self.navigationItem.rightBarButtonItem.title = @"完成";
[self.button setImage:[UIImage imageNamed:@"删除"] forState:UIControlStateNormal];
    }
    else
    {
    self.navigationItem.rightBarButtonItem.title = @"编辑";
        [self.button setImage:[UIImage imageNamed:@"购买"] forState:UIControlStateNormal];
    }
    [_tableView reloadData];
}
-(NSInteger )numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArr.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCarTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    ShopCarModel *model  = _dataArr[indexPath.section];
    cell.titleLabel.text = model.title;
    cell.peopleCount.text = [NSString stringWithFormat:@"总需%@人次,剩余%@人次",model.canyurenshu,model.shenyurenshu];
    cell.joinPeople.text = @"参与人次";
    cell.joinDate.text = @"参与期数";
    if(flag)
    {
        cell.alertBtn.hidden = NO;
    }else
    {
        cell.alertBtn.hidden = YES;
    }
    [cell.alertBtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
    [cell.alertBtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];
    [cell.alertBtn addTarget:self action:@selector(smallBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [cell.buttonAdd addTarget:self action:@selector(jiahao:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonSubtract addTarget:self action:@selector(jianhao:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonAdd1 addTarget:self action:@selector(jiahao1:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonSubtract1 addTarget:self action:@selector(jianhao1:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.quantity.text = self.rowArr[indexPath.section];
    cell.quantity1.text = self.rowArr1[indexPath.section];
    cell.buttonSubtract .tag = indexPath.section +10000;
    cell.buttonAdd .tag = indexPath.section +10000;
    cell.buttonSubtract1 .tag = indexPath.section +20000;
    cell.buttonAdd1 .tag = indexPath.section +20000;
    cell.alertBtn.tag = indexPath.section;
    if ([self.selectArr[indexPath.section] isEqualToString:@"0"] ) {
        cell.alertBtn.selected = YES;
    }
    else{
        cell.alertBtn.selected = NO;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 254*kScreenHeight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 12*kScreenHeight;
}
-(void)jiahao:(UIButton *)jia
{
    NSInteger b = [[self.rowArr objectAtIndex:jia.tag - 10000] integerValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.tableView reloadData];
    
    
}
-(void)jianhao:(UIButton *)jian
{ NSInteger b = [[self.rowArr objectAtIndex:jian.tag - 10000] integerValue];
    
    if(b> 0)
    {
        b--;
        [self.rowArr replaceObjectAtIndex:jian.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
        
        [self.tableView reloadData];
        
    }
}
-(void)jiahao1:(UIButton *)jia
{
    NSInteger b = [[self.rowArr1 objectAtIndex:jia.tag - 20000] integerValue];
    b++;
    [self.rowArr1 replaceObjectAtIndex:jia.tag - 20000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.tableView reloadData];
    
    
}
-(void)jianhao1:(UIButton *)jian
{ NSInteger b = [[self.rowArr1 objectAtIndex:jian.tag - 20000] integerValue];
    
    if(b> 0)
    {
        b--;
        [self.rowArr1 replaceObjectAtIndex:jian.tag - 20000 withObject:[NSString stringWithFormat:@"%ld",b ]];
        
        [self.tableView reloadData];
        
    }
}

-(void)bottom
{
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400 *kScreenHeight)];
    foot.backgroundColor = RGBA(239, 239, 239, 1);
//    foot.backgroundColor = [UIColor grayColor];
    self.tableView.tableFooterView = foot;
    UIView *bView = [UIView new];
    [self.view addSubview:bView];
    
    bView.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(96 *kScreenHeight);
    
    bView.backgroundColor = [UIColor whiteColor];
    self.total = [[UILabel alloc] initWithFrame:CGRectMake(30 *kScreenWidth, 0, 100 *kScreenWidth, bView.frame.size.height)];
    [bView addSubview:self.total];
    self.total.text = @"共1件";
    self.total.font = [ UIFont systemFontOfSize:30 *kScreenWidth];
//    total.textColor = RGBA(255, 85, 0, 1);
 self.count =[[ UILabel alloc] initWithFrame:CGRectMake(self.total.right+ 50 *kScreenWidth, 0, 400 *kScreenWidth, bView.frame.size.height)];
    [bView addSubview:self.count];
    self.count.font = [ UIFont systemFontOfSize:30 *kScreenWidth];
    self.count.text = @"总计: 300夺宝币";
    self.button =[ UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(515 *kScreenWidth, 96 * kScreenHeight / 2 - 111 * kScreenWidth / 2, 189 *kScreenWidth, 111*kScreenWidth);
    [self.button setImage:[UIImage imageNamed:@"购买"] forState:UIControlStateNormal];
    [bView addSubview:self.button];
    [self.button addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];

}
-(void)payAction:(UIButton *)btn
{
//    NSLog(@"购买");
    if (!flag) {
        AdressViewController *adress = [[AdressViewController alloc] init];
        adress.name = @"地址选择";
        [self.navigationController pushViewController:adress animated:YES];

    }
    else
    {
        NSLog(@"删除");
        NSLog(@"%@",_delegateArray);
        if (_delegateArray.count != 0) {
            NSString *IdStr = @"";
            for (NSString *Id in [_delegateArray copy]) {
                NSString *string = [NSString stringWithFormat:@"%@,",Id];
                IdStr = [IdStr stringByAppendingString:string];
            }
            IdStr = [IdStr substringToIndex:IdStr.length - 1];
            NSLog(@"%@",IdStr);
            [self loaDataDelete:IdStr];
            
    }
    
        
    }
}
-(void)smallBtn:(UIButton *)sender
{
    NSLog(@"%ld",sender.tag);
    //删除
    if([_selectArr[sender.tag] isEqualToString:@"0"])
    {
        [_selectArr replaceObjectAtIndex:sender.tag withObject:@"1"] ;
        ShopCarModel *smodel = _dataArr[sender.tag];
        for (NSString *Id in _delegateArray) {
            if ([Id isEqualToString:smodel.ID]) {
                [self.delegateArray removeObject:Id];
            }
        }
        
    }
    else
    {
             [_selectArr replaceObjectAtIndex:sender.tag  withObject:@"0"];
        
        ShopCarModel *s = _dataArr[sender.tag];
        for (NSString *Id in [self.delegateArray copy]) {
            if ([Id isEqualToString:s.ID]) {
                [self.delegateArray removeObject:Id];
                
            }
        }
        [self.delegateArray addObject:s.ID];


    }
    [_tableView reloadData];
}
-(void)loaDataDelete:(NSString *)Ids
{
    [ShopCarModel setWithGid:@"5" Withuid:TOKEN WithBlock:^(id value) {
        for (NSString *Id in [_delegateArray copy]) {
            [self.delegateArray removeObject:Id];
        }
        if (_delegateArray.count == 0) {
//            self.shopCarView.sumMoneyLabel.text = @"";
        }
        [AlertAndActionTool showCancleAlertWith:@"提示" AndContent:@"删除成功" AndViewController:self AndCallBack:^{
            [self loadData];
            flag = NO;
            self.navigationItem.rightBarButtonItem.title = @"编辑";
            [self.button setImage:[UIImage imageNamed:@"购买"] forState:UIControlStateNormal];
        }];
       
    }];
}
@end
