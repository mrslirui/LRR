//
//  PayStyleViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PayStyleViewController.h"

#import "PayTableViewCell1.h"
#import "GoTableViewCell.h"
@interface PayStyleViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag ;
}
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)NSArray *nameArr;
@property(nonatomic,retain)GoTableViewCell *currentCell;

@end

@implementation PayStyleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _tableView.backgroundColor = RGBA(239, 239, 239, 1);
    self.navigationItem.title = @"购物车";
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[PayTableViewCell1 class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[GoTableViewCell class] forCellReuseIdentifier:@"cell2"];
    self.imgArr = @[@"weixin@3x_1",@"zhifubao@3x_2"];
    self.nameArr = @[@"微信",@"支付宝"];

    [self bottom];
    flag = NO;

}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 2 ) {
        if(flag == YES)
        {
            return _nameArr.count;
            
        }else
        {
            return 0;
        }
    }
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
{        PayTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.label.text = @"余额支付";
    cell.detailLbel.text = @"(账户余额: 0.63夺宝币)";
    [cell.rightBtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
    [cell.rightBtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];
    [cell.rightBtn addTarget:self action:@selector(smallBtn1:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
    
}
else if (indexPath.section == 1)
{
    PayTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    cell.label.text =@"其他支付方式";
    cell.detailLbel.hidden = YES;
    [cell.rightBtn setImage:[UIImage imageNamed:@"up@3x_1"] forState:UIControlStateNormal];
    [cell.rightBtn setImage:[UIImage imageNamed:@"down@3x"] forState:UIControlStateSelected];
    [cell.rightBtn addTarget:self action:@selector(smallBtn:) forControlEvents:UIControlEventTouchUpInside];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if(flag == YES )
    {
        cell.rightBtn.selected = YES;
    }
    else
    {
        cell.rightBtn.selected = NO;
    }
    return cell;
}
    
else
{ GoTableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2" forIndexPath:indexPath];
    
    cell.imgView.image =[UIImage imageNamed:_imgArr[indexPath.row]];
    cell.name.text = _nameArr[indexPath.row];
    [cell.zhifubtn addTarget:self action:@selector(smallBtn2:) forControlEvents:UIControlEventTouchUpInside];
    [cell.zhifubtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
    [cell.zhifubtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];
    
    cell.zhifubtn.tag = indexPath.row;
       return cell;
    
}
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.section == 0 )
    {
        return 88*kScreenHeight;
    }
    else if(indexPath.section == 1)
    {
        return 88*kScreenHeight;
    }
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{if(section == 2)
{
    return 0.1;
}
    
    return 18*kScreenHeight;
}
-(void)smallBtn:(UIButton *)sender
{
    //更多支付方式
sender.selected = !sender.selected;
    if(sender.selected)
    {
        flag = YES;
    }else
    {
        flag = NO;
    }
    
    [_tableView reloadData];
}
#pragma mark -选择是支付宝还是微信
-(void)smallBtn2:(UIButton *)sender
{
//sender.selected = !sender.selected;
//    //支付
//    if (sender.selected) {
//        
//    
//    }else
//    {
//    }
    CGPoint correctedPoint =[sender convertPoint:sender.bounds.origin toView:self.tableView];
    NSIndexPath *indexpath = [_tableView indexPathForRowAtPoint:correctedPoint];
    NSLog(@"Button tapped in row %ld", indexpath.row);
    
    GoTableViewCell *cell = [_tableView cellForRowAtIndexPath:indexpath];
    _currentCell.zhifubtn.selected = NO;
    NSLog(@"%@",_currentCell.name.text);
    cell.zhifubtn.selected = YES;
    NSLog(@"%@",cell.name.text);
    _currentCell = cell;

    
}
#pragma mark -选择余额支付
-(void)smallBtn1:(UIButton *)sender
{
    //余额
    sender.selected = !sender.selected;
}

-(void)bottom
{
//    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600 *kScreenHeight)];
//    foot.backgroundColor = RGBA(239, 239, 239, 1);
//    self.tableView.tableFooterView = foot;
    UIView *bView = [UIView new];
    [self.view addSubview:bView];
    
    bView.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,0)
    .rightSpaceToView(self.view,0)
    .heightIs(96 *kScreenHeight);
    
    bView.backgroundColor = [UIColor whiteColor];
    UILabel *total = [[UILabel alloc] initWithFrame:CGRectMake(30 *kScreenWidth, 0, 100 *kScreenWidth, bView.frame.size.height)];
    [bView addSubview:total];
    total.text = @"共1件";
    total.font = [ UIFont systemFontOfSize:30 *kScreenWidth];
    //    total.textColor = RGBA(255, 85, 0, 1);
    UILabel *count =[[ UILabel alloc] initWithFrame:CGRectMake(total.right+ 50 *kScreenWidth, 0, 400 *kScreenWidth, bView.frame.size.height)];
    [bView addSubview:count];
    count.font = [ UIFont systemFontOfSize:30 *kScreenWidth];
    count.text = @"总计: 300夺宝币";
    UIButton *button =[ UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(515 *kScreenWidth, 96 * kScreenHeight / 2 - 111 * kScreenWidth / 2, 189 *kScreenWidth, 111*kScreenWidth);
    [button setImage:[UIImage imageNamed:@"支付"] forState:UIControlStateNormal];
    [bView addSubview:button];
    [button addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)payAction:(UIButton *)btn
{
    //    NSLog(@"购买");
    //购买
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
