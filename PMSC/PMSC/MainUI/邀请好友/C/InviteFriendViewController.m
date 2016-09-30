//
//  InviteFriendViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "InviteFriendViewController.h"

@interface InviteFriendViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@end

@implementation InviteFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"邀请好友";
    _tableView.backgroundColor = kHexColor(0xeeeeee);
    _dataArr = @[@"通讯录",@" 手机号",@" QQ",@"微信"];
    _imgArr = @[@"电话@3x",@"tongxunlu@3x_1",@"qq@3x_2",@"weixin_r@3x_3"];
    _tableView.scrollEnabled = NO;
    
     UIView *gView=[[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, Screen_HEIGHT)];
    _tableView.tableFooterView =gView;
    gView.backgroundColor = kHexColor(0xeeeeee);
   
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *aView =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, 90*kScreenHeight)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20*kScreenWidth, 0, 500*kScreenWidth, aView
                                                               .height)];
    [aView addSubview:label];
    label.text = @"邀请方式";
    label.font = [UIFont systemFontOfSize:30*kScreenWidth];
    return aView;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 90*kScreenHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
