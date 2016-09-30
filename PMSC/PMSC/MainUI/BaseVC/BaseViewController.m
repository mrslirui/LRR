//
//  BaseViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/22.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseViewController.h"
#import "LoginViewController.h"
@interface BaseViewController ()
@property (nonatomic, weak) UIImageView *lineView;

@end

@implementation BaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
//    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
     [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    
    self.navigationController .navigationBar.translucent = NO;
    
    self.navigationController.navigationBar.barTintColor =  kAppColor;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:32 *kScreenWidth],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    _lineView = [self getLineViewInNavigationBar:self.navigationController.navigationBar];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(login) name:@"登录界面" object:nil];
    

}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    _lineView.hidden = YES;
  
    NSArray *viewControllers = [NSArray arrayWithArray:self.navigationController.viewControllers];
    if (viewControllers.count != 0)
    {
        UIViewController *firstVC = [self.navigationController.viewControllers objectAtIndex:0];
        
        if (self == firstVC)
        {
            self.navigationItem.hidesBackButton = YES;
            self.tabBarController.tabBar.hidden = NO;

        }
        else
        {
           self.tabBarController.tabBar.hidden = YES;
        }
    }
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    _lineView.hidden = NO;
}
-(void)dealloc
{
         [[NSNotificationCenter defaultCenter] removeObserver:self];

}

//找到导航栏最下面黑线视图
- (UIImageView *)getLineViewInNavigationBar:(UIView *)view
{
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self getLineViewInNavigationBar:subview];
        if (imageView) {
            return imageView;
        }
    }
    
    return nil;
}
-(void)login
{
    [self.navigationController pushViewController:[LoginViewController new] animated:YES];
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
