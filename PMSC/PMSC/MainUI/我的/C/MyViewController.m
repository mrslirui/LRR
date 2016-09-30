//
//  MyViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyViewController.h"
#import "MyView.h"
#import "HelpViewController.h"
#import "ChongzhiViewController.h"
#import "AdressViewController.h"
#import "GoChongzhiViewController.h"
#import "DuobaojiluViewController.h"
#import "SetViewController.h"
#import "ShaidanViewController.h"
#import "NoShaidanViewController.h"
#import "ZhongjiangViewController.h"
#import "ChangeViewController.h"
#import "InviteFriendViewController.h"
#import "MyPostedViewController.h"
#import "ProfitAndLossViewDetailViewController.h"
#import "SignInViewController.h"
#import "LoginViewController.h"
#import "PersonViewController.h"
#import "LoginViewController.h"
#import "MyModel.h"
#import "ChangeDetailViewController.h"

@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)MyView *myView;
@property(nonatomic,retain)NSArray *dataArr;
@property(nonatomic,retain)NSArray *imgArr;
@end

@implementation MyViewController
#pragma mark - 懒加载
-(NSArray *)dataArr
{
    if(!_dataArr)
    {
        _dataArr = @[@[@"夺宝记录",@"中奖收货",@"我的晒单"],@[@"充值记录",@"地址管理",@"转账管理"],@[@"邀请好友",@"每日签到"],@[@"帮助",@"发帖管理",@"投注记录"]];
    }
    return _dataArr;
    
}
-(NSArray *)imgArr
{
    if(!_imgArr)
    {
        _imgArr = @[@[@"my1",@"my2",@"my3"],@[@"my4",@"my5",@"my6"],@[@"my7",@"my8"],@[@"my9",@"my10",@"my11"]];
           
    }
    return _imgArr;
}
- (MyView *)myView
{
    if (!_myView)
    {
        self.myView = [[MyView alloc] initWithFrame:self.view.bounds];
        _myView.tableView.dataSource = self;
        _myView.tableView.delegate = self;
        
    }
    return _myView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    if(TOKEN != nil)
    {
        self.myView.tableView.tableHeaderView = self.myView.headView;
        self.myView.phonelb.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"][@"username"];
//        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"login"][@"username"]);
        [self loadData];
    }
    else
    {
        self.myView.tableView.tableHeaderView = self.myView.headView1;
    }
   }

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的";
    self.myView = [[MyView alloc] initWithFrame:self.view.bounds];
    _myView.tableView.dataSource = self;
    _myView.tableView.delegate = self;

    [self.view addSubview:self.myView];
    self.myView.tableView.backgroundColor = kHexColor(0xeeeeee);
    self.myView.backgroundColor = kHexColor(0xeeeeee);
   
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"设置"] style:UIBarButtonItemStylePlain target:self action:@selector(right)];
    UITapGestureRecognizer *tap =[[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.myView.bgView addGestureRecognizer:tap];
    [self.myView.rightArrow addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.myView.login addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
     [self.myView.chongzhiBtn addTarget:self action:@selector(chongzhi) forControlEvents:UIControlEventTouchUpInside];
   
    UITapGestureRecognizer *btap =[[ UITapGestureRecognizer alloc] initWithTarget:self action:@selector(detailAction)];
    [self.myView.bgView1 addGestureRecognizer:btap];
    
   }

#pragma mark -加载数据
-(void)loadData
{ [MyModel setWithToken:TOKEN WithBlock:^(id returnValue) {
    
    NSLog(@"%@",returnValue);
    [self.myView.head sd_setImageWithURL:[NSURL URLWithString:returnValue[@"img"]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
    self.myView.duobaoLb.text = [NSString stringWithFormat:@"余额: %@夺宝币",returnValue[@"money"]];
    self.myView.jifenLb.text = [NSString stringWithFormat:@"积分: %@",returnValue[@"score"]];
    [[NSUserDefaults standardUserDefaults] setObject:@{@"夺宝币":returnValue[@"money"],@"积分":returnValue[@"score"]} forKey:@"myMoney"];
}];
    
}
#pragma mark -充值详情
-(void)detailAction
{
    [self.navigationController pushViewController:[ChangeDetailViewController new] animated:YES];

}
#pragma mark -充值
-(void)chongzhi
{
    NSLog(@"1111");
    [self.navigationController pushViewController:[GoChongzhiViewController new] animated:YES];

}
#pragma mark -手势
-(void)tapAction:(UIButton *)sender
{
    //基本信息
    [self.navigationController pushViewController:[PersonViewController new] animated:YES];
}
#pragma mark - barButton
-(void)right{
    
    
    [Address pushLoginWithBlock:^{
        SetViewController *se =[[SetViewController alloc] initWithNibName:@"SetViewController" bundle:nil];
        //    se.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:se animated:YES];

    }];
}
#pragma mark -登陆按钮
-(void)loginClick
{
    [self.navigationController pushViewController:[LoginViewController new] animated:YES];

}
#pragma mark - tableView dataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataArr[section] count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    if(!cell)
    {
        cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    }
    cell.textLabel.text = _dataArr[indexPath.section][indexPath.row];
    cell.textLabel.textColor = kHexColor(0x000000);
    cell.imageView.image = [UIImage imageNamed:self.imgArr[indexPath.section][indexPath.row]];
    cell.textLabel.font = [UIFont systemFontOfSize: 30 *kScreenWidth];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
       return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
       return 12 *kScreenHeight;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section == 1 && indexPath.row == 0)
    {[Address pushLoginWithBlock:^{
        [self.navigationController pushViewController:[ChongzhiViewController new] animated:YES];

    }];
    }
    if(indexPath.section == 3&&indexPath.row == 0)
    {
         [Address pushLoginWithBlock:^{
        [self.navigationController pushViewController:[HelpViewController new] animated:YES];
             
   }];
        
    }
    if(indexPath.section == 1&&indexPath.row == 1)
    {
        
        [Address pushLoginWithBlock:^{
            AdressViewController *adre = [[AdressViewController alloc] init];
            adre.name = @"地址管理";
            [self.navigationController pushViewController:adre animated:YES];
        }];
    }
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        if (TOKEN != nil) {
             [self.navigationController pushViewController:[DuobaojiluViewController new] animated:YES];
        }
        else
        {
            [self.navigationController pushViewController:[LoginViewController new] animated:YES];
        }
       
    }
    if (indexPath.section == 0&& indexPath.row == 2) {
        
        [Address pushLoginWithBlock:^{
        [self.navigationController pushViewController:[ShaidanViewController new] animated:YES];

        }];
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        
        [Address pushLoginWithBlock:^{
    [self.navigationController pushViewController:[ZhongjiangViewController new] animated:YES];

        }];
    }
    if (indexPath.section == 1 && indexPath.row == 2) {
        
        [Address pushLoginWithBlock:^{
            [self.navigationController pushViewController:[ChangeViewController new] animated:YES];

        }];
    }
    if (indexPath.section == 2 && indexPath.row == 0) {
        [Address pushLoginWithBlock:^{
            InviteFriendViewController *invite = [[InviteFriendViewController alloc] initWithNibName:@"InviteFriendViewController" bundle:nil];
            [self.navigationController pushViewController:invite animated:YES];

        }];
           }
    if (indexPath.section == 2 && indexPath.row == 1) {
        [Address pushLoginWithBlock:^{
            [self.navigationController pushViewController:[SignInViewController new] animated:YES];

        }];
    }
    if (indexPath.section == 3 && indexPath.row == 1) {
        [Address pushLoginWithBlock:^{
            
            [self.navigationController pushViewController:[MyPostedViewController new] animated:YES];

        }];
    }
    if (indexPath.section == 3 && indexPath.row == 2) {
        [Address pushLoginWithBlock:^{
            [self.navigationController pushViewController:[ProfitAndLossViewDetailViewController new] animated:YES];

        }];
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
    // Get the new view co                                                                                                                                                                                                                                                                                                                                                                                                                                                           ntroller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
