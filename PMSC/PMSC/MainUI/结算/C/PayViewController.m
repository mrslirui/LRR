//
//  PayViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PayViewController.h"
#import "PayTableViewCell.h"
#import "PayTableViewCell1.h"
#import "GoTableViewCell.h"
#import "PaySucessViewController.h"
@interface PayViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    BOOL flag;
}
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic,retain)NSMutableArray *rowArr1; /*** 加减号数组 */
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)NSArray *nameArr;
@property(nonatomic,retain)GoTableViewCell *currentCell;

@end

@implementation PayViewController
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
        self.rowArr =[@[@"0"] mutableCopy];
    }
    return _rowArr;
}
-(NSMutableArray *)rowArr1
{
    if(!_rowArr1)
    {
        self.rowArr1 = [NSMutableArray array];
        self.rowArr1 =[@[@"0"] mutableCopy];
    }
    return _rowArr1;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"结算";
    self.tableView.backgroundColor = RGBA(239, 239, 239, 1);
    [self.tableView registerClass:[PayTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[PayTableViewCell1 class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[GoTableViewCell class] forCellReuseIdentifier:@"cell2"];
    self.imgArr = @[@"weixin@3x_1",@"zhifubao@3x_2"];
    self.nameArr = @[@"微信",@"支付宝"];
    [self bottom];
    flag = NO;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 3 ) {
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
    if (indexPath.section == 0) {
        PayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.titleLabel.text = @"路由器从不同角度看路由器";
        cell.peopleCount.text = @"总需134人次,剩余90人次";
        cell.joinPeople.text = @"参与人次";
        cell.joinDate.text = @"参与期数";
        [cell.buttonAdd addTarget:self action:@selector(jiahao:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonSubtract addTarget:self action:@selector(jianhao:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonAdd1 addTarget:self action:@selector(jiahao1:) forControlEvents:UIControlEventTouchUpInside];
        [cell.buttonSubtract1 addTarget:self action:@selector(jianhao1:) forControlEvents:UIControlEventTouchUpInside];
        cell.quantity.text = self.rowArr[indexPath.row];
        cell.quantity1.text = self.rowArr1[indexPath.row];
        cell.buttonSubtract .tag = indexPath.section +10000;
        cell.buttonAdd .tag = indexPath.section +10000;
        cell.buttonSubtract1 .tag = indexPath.section +20000;
        cell.buttonAdd1 .tag = indexPath.section +20000;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
        return cell;
    }
    else if (indexPath.section == 1)
    {        PayTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell.label.text = @"余额支付";
        cell.detailLbel.text = @"(账户余额: 0.63夺宝币)";
        [cell.rightBtn setImage:[UIImage imageNamed:@"椭圆-1@3x"] forState:UIControlStateNormal];
        [cell.rightBtn  setImage:[UIImage imageNamed:@"椭圆-1-副本-2@3x"] forState:UIControlStateSelected];
        [cell.rightBtn addTarget:self action:@selector(smallBtn1:) forControlEvents:UIControlEventTouchUpInside];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;

        
    }
 else if (indexPath.section == 2)
 {
     PayTableViewCell1 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
     cell.label.text =@"其他支付方式";
     cell.detailLbel.hidden = YES;
     [cell.rightBtn setImage:[UIImage imageNamed:@"up@3x_1"] forState:UIControlStateNormal];
     [cell.rightBtn setImage:[UIImage imageNamed:@"down@3x"] forState:UIControlStateSelected];
     [cell.rightBtn addTarget:self action:@selector(smallBtn:) forControlEvents:UIControlEventTouchUpInside];
//     cell.backgroundColor = kAppColor;
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
        
        return cell;
        
    }
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 310*kScreenHeight;
    }
    else if (indexPath.section == 1 )
    {
        return 88*kScreenHeight;
    }
    else if(indexPath.section == 2)
    {
        return 88*kScreenHeight;
    }
    return 40;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{if(section == 3)
{
    return 0.1;
}
    
    return 18*kScreenHeight;
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
-(void)smallBtn2:(UIButton *)sender
{
    
    //支付
  
    
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
-(void)smallBtn1:(UIButton *)sender
{
    //余额
    sender.selected = !sender.selected;
  }

-(void)bottom
{
    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 600 *kScreenHeight)];
        foot.backgroundColor = RGBA(239, 239, 239, 1);
    self.tableView.tableFooterView = foot;
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
    //支付
    [self.navigationController pushViewController:[PaySucessViewController new] animated:YES];
    
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
