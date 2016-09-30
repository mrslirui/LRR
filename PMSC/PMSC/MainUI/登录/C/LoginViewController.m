//
//  LoginViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>
@property(nonatomic,retain)LoginView  *loginView;
@end


@implementation LoginViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];

}
-(LoginView *)loginView
{
    if (!_loginView) {
        _loginView  =[[LoginView alloc] initWithFrame:self.view.bounds];
    }
    return _loginView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview: self.loginView];
    self.title = @"登录";
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStyleDone target:self action:@selector(backToLast)];
    [_loginView.registerbtn addTarget:self action:@selector(registerbutton) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.forgetPsw addTarget:self action:@selector(forget) forControlEvents:UIControlEventTouchUpInside];
    [_loginView.login addTarget:self action:@selector(loginBtn:) forControlEvents:UIControlEventTouchUpInside];
    _loginView.pswField.delegate = self;
    [_loginView.phoneField addTarget:self action:@selector(textback) forControlEvents:UIControlEventEditingChanged];
    [_loginView.phoneField setAutoAdjust:YES];
    [_loginView.pswField setAutoAdjust:YES];

    
}


#pragma mark -textfield的限制代理方法
-(void)textback
{
    [BaseTextField textFieldDidChange:self.loginView.phoneField Count:11];
    
}

-(void)registerbutton
{
    [self.navigationController pushViewController:[RegisterViewController new] animated:YES];
}
-(void)forget
{
    /*** 忘记密码 */
}
-(void)loginBtn:(UIButton *)btn
{
    NSLog(@"点击登录");
    if(_loginView.pswField.text.length >= 6 && _loginView.pswField.text.length <= 8)
    {
        if ([XLMethod valiMobile:_loginView.phoneField.text]) {
            
            NSDictionary *dic = @{@"username":_loginView.phoneField.text,@"password":_loginView.pswField.text};
           
            [self loadDATA:dic];
        }else
        {
            [ AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入正确手机号" AndViewController:self];

        }
    }
    else
    {
        [ AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入六到八位位密码" AndViewController:self];

    }
}
- (void)loadDATA:(NSDictionary *)dict
{
    [xl_HttpManager httpManagerPostParameter:dict toHttpUrlStr:Login isCacheorNot:NO targetViewController:self andUrlFunctionName:@"login" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        [[ NSUserDefaults  standardUserDefaults]  setObject:dict forKey:@"login"];
        
        [[NSUserDefaults standardUserDefaults] setObject:responseObject[@"data"] forKey:@"token"];
        NSLog(@"%@",TOKEN);
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.navigationController popViewControllerAnimated:YES];

    } orFail:^(NSError *error) {
        
    }];
   
    
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
