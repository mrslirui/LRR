//
//  SetViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SetViewController.h"
#import "ChangePwdViewController.h"
#import "LoginViewController.h"
#import "AboutViewController.h"
#import "SetTableViewCell.h"
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"设置";
    _tableView.backgroundColor = kHexColor(0xeeeeee);
    _dataArr = @[@" 修改密码",@"关于我们",@""];
    _imgArr = @[@"xgmm@3x_1",@"gywm@3x_2",@""];
    _tableView.scrollEnabled = NO;
    [_tableView registerClass:[SetTableViewCell class] forCellReuseIdentifier:@"cell1"];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _imgArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   if(indexPath.row != 2)
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
   }
    else
        
    {
        SetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell.outLogin.text = @"退出登录";
        return cell;
        
    }
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.row == 0)
    {
        [self.navigationController pushViewController:[ChangePwdViewController new] animated:YES];
    }
    if(indexPath.row == 1)
    {
        [self.navigationController pushViewController:[AboutViewController new] animated:YES];
    }
    if(indexPath.row == 2)
    {
        [[NSUserDefaults standardUserDefaults] setObject:nil forKey:@"token"];
        NSLog(@"token:%@",TOKEN);

        [self.navigationController popViewControllerAnimated:YES];
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
