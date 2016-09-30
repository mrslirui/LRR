//
//  PaySucessViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PaySucessViewController.h"
#import "PaySucessView.h"
#import "DuobaojiluViewController.h"
#import "ShopViewController.h"
@interface PaySucessViewController ()
@property(nonatomic,retain)PaySucessView *psView;
@end

@implementation PaySucessViewController

-(PaySucessView *)psView
{
    if (!_psView) {
        _psView = [[PaySucessView alloc] initWithFrame:self.view.bounds];
        
    }
    return _psView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.psView];
    self.navigationItem.title = @"购物车";
    [self.psView.shopButton addTarget:self action:@selector(shopButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.psView.lookButton addTarget:self action:@selector(lookButtonAction:) forControlEvents:UIControlEventTouchUpInside];

}
//查看夺宝记录
- (void)shopButtonAction:(UIButton *)sender
{[self.navigationController pushViewController:[DuobaojiluViewController new] animated:YES];
    
}
//返回首页
- (void)lookButtonAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"选择点击tabbarItem" object:nil userInfo:@{@"VC":[ShopViewController new]}];

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
