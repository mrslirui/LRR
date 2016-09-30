//
//  RegisterViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "MyViewController.h"
@interface RegisterViewController ()
@property(nonatomic,retain)RegisterView *rView;
@property(nonatomic,retain)NSString *verifyStr;
@end

@implementation RegisterViewController

-(RegisterView *)rView
{
    if (!_rView) {
        _rView = [[RegisterView alloc] initWithFrame:self.view.bounds];
    }
    return _rView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.rView];
    self.navigationItem.title =@"注册";
    [_rView.yanzheng addTarget:self action:@selector(yanzhengAction:) forControlEvents:UIControlEventTouchUpInside];
    [_rView.comButton addTarget:self action:@selector(buttonAction:) forControlEvents:(UIControlEventTouchUpInside)];
  [_rView.iphone addTarget:self action:@selector(textback) forControlEvents:UIControlEventEditingChanged];
}
-(void)textback
{
    [BaseTextField textFieldDidChange:self.rView.iphone Count:11];
    
}

-(void)buttonAction:(UIButton *)sender
{
    NSLog(@"完成");
   
    NSLog(@"%@",@{@"username":_rView.iphone.text,@"password":_rView.pass.text,@"verify":_rView.verification.text});
    if(_rView.pass.text.length >= 6 && _rView.pass.text.length <= 8)
    {
        if([self.verifyStr isEqualToString:_rView.verification.text])
        {
    [xl_HttpManager httpManagerPostParameter:@{@"username":_rView.iphone.text,@"password":_rView.pass.text,@"verify":_rView.verification.text} toHttpUrlStr:Register isCacheorNot:NO targetViewController:self andUrlFunctionName:@"regis" isValidate:NO success:^(id responseObject) {
        
        NSLog(@"%@",responseObject);
        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"data"] forKey:@"token"];
        
        [[NSUserDefaults standardUserDefaults] setObject:@{@"username":_rView.iphone.text,@"password":_rView.pass.text,@"verify":_rView.verification.text} forKey:@"Rlogin"];
        
       [[NSUserDefaults standardUserDefaults] synchronize];

        [AlertAndActionTool showCancleAlertWith:@"提示" AndContent:@"注册成功" AndViewController:self AndCallBack:^{

            [self.navigationController popViewControllerAnimated:YES];
        
        }];
    } orFail:^(NSError *error) {
        
    }];
    }
    else
    {
        [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"验证码错误" AndViewController:self];
    }
    }
    else
    {
        [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入六位到八位密码" AndViewController:self];
    }
}

-(void)yanzhengAction:(XLTimerButton* )btn
{
    NSLog(@"验证");
    
    if ([XLMethod  valiMobile:_rView.iphone.text]) {
        [btn startTimer];
        btn.title = @"发送验证码";
        
        [xl_HttpManager httpManagerPostParameter:@{@"mobile":self.rView.iphone.text} toHttpUrlStr:GetVerify isCacheorNot:NO targetViewController:self andUrlFunctionName:@"zhuce" isValidate:NO success:^(id responseObject) {
            NSLog(@"%@",responseObject);
            self.verifyStr = responseObject[@"verify"];
        } orFail:^(NSError *error) {
            [btn stopTimer];
            btn.title = @"发送验证码";

        }];
        
    }else{
        [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入正确的手机号码" AndViewController:self];
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
