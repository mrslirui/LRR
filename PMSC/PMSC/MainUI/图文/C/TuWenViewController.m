//
//  TuWenViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "TuWenViewController.h"

@interface TuWenViewController ()
@property(nonatomic,retain)UIButton *button;
@end

@implementation TuWenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self bottom];
}
-(void)bottom
{
//    UIView *foot =[[ UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 400 *kScreenHeight)];
//    foot.backgroundColor = RGBA(239, 239, 239, 1);
//    //    foot.backgroundColor = [UIColor grayColor];
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
    self.button =[ UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = CGRectMake(515 *kScreenWidth, 96 * kScreenHeight / 2 - 111 * kScreenWidth / 2, 189 *kScreenWidth, 111*kScreenWidth);
    [self.button setImage:[UIImage imageNamed:@"购买"] forState:UIControlStateNormal];
    [bView addSubview:self.button];
    [self.button addTarget:self action:@selector(payAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
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
