//
//  ChangePwdViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangePwdViewController.h"
#import "ChangePwdView.h"
@interface ChangePwdViewController ()
@property(nonatomic,retain)ChangePwdView *cView;
@end

@implementation ChangePwdViewController
-(ChangePwdView *)cView
{
    if (!_cView) {
        _cView = [[ChangePwdView alloc] initWithFrame:self.view.bounds];
    }
    return _cView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.cView];
    self.navigationItem.title = @"修改密码";
    [self.cView.DoneBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)done:(UIButton *)btn

{
    NSLog(@"%@",_cView.nPswText.text);
    // 保存
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
