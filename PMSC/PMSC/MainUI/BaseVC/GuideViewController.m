//
//  GuideViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "GuideViewController.h"
#import "BaseTabBarViewController.h"
@interface GuideViewController ()<UIScrollViewDelegate,UIApplicationDelegate>
@property (nonatomic, retain)UIScrollView *scrollView;
@property(nonatomic,retain)BaseTabBarViewController *tabbar;
@property(nonatomic,assign)id<UIApplicationDelegate> appdelegate;
@end

@implementation GuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self guideScroll];
}


#pragma mark -引导页
- (void)guideScroll
{
    NSArray *imagesArray = @[@"引导页1.jpg", @"引导页2.jpg", @"引导页3.jpg"];
    //判断程序是否第一次启动
    //第一次启动操作
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.delegate = self;
    [self.scrollView setContentSize:CGSizeMake(Screen_WIDTH * imagesArray.count, 0)];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView showsHorizontalScrollIndicator];
    [self.scrollView setBounces:NO];
    for (int i = 0; i < imagesArray.count; i++) {
        
        UIImageView *images =[[UIImageView alloc]initWithFrame:CGRectMake(i * Screen_WIDTH, 0, Screen_WIDTH, Screen_HEIGHT)];
        [images setImage:[UIImage imageNamed:[imagesArray objectAtIndex:i]]];
        [self.scrollView addSubview:images];
    }
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake((imagesArray.count - 1) * Screen_WIDTH + 200*kScreenWidth, 1040*kScreenHeight, 312*kScreenWidth, 74*kScreenHeight)];
    [button setImage:[UIImage imageNamed:@"立即体验"] forState:UIControlStateNormal];
    //    [button.titleLabel setFont:[UIFont systemFontOfSize:22]];
    
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button];
    [self.view addSubview:self.scrollView];
    self.appdelegate = [UIApplication sharedApplication].delegate;


}

- (void)buttonClick {
    self.tabbar  = [[BaseTabBarViewController alloc] init];

    [UIView animateWithDuration:1 animations:^{
        self.scrollView.alpha = 0;

    } completion:^(BOOL finished) {
        _appdelegate.window.rootViewController =_tabbar;

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
