//
//  ShaidanSuccessViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/6.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShaidanSuccessViewController.h"
#import "PaySucessView.h"
#import "ShaidanViewController.h"
#import "ZhongjiangViewController.h"
@interface ShaidanSuccessViewController ()
@property(nonatomic,retain)PaySucessView *psView;

@end

@implementation ShaidanSuccessViewController
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
    self.title = @"晒单成功";
    [self.view addSubview:self.psView];
[self.psView.shopButton addTarget:self action:@selector(shopButtonAction:) forControlEvents:UIControlEventTouchUpInside];
[self.psView.lookButton addTarget:self action:@selector(lookButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.psView.imgView.image = [UIImage imageNamed:@"人物"];
    self.psView.label.text = @"晒单成功";
    [self.psView.shopButton setBackgroundImage:[UIImage imageNamed:@"查看晒单记录"] forState:UIControlStateNormal];
    
    [self.psView.lookButton  setBackgroundImage:[UIImage imageNamed:@"返回至已收货"] forState:UIControlStateNormal];

}
//查看晒单记录
- (void)shopButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[ShaidanViewController new] animated:YES];
    
}
//返回已收货
- (void)lookButtonAction:(UIButton *)sender
{
    
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[ZhongjiangViewController class]]) {
            ZhongjiangViewController *revise =(ZhongjiangViewController *)controller;
            [self.navigationController popToViewController:revise animated:YES];
        }
    }  }

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
