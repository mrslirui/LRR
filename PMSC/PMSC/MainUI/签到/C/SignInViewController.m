//
//  SignInViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SignInViewController.h"
#import "SignInView.h"
#import "SignInCollectionViewCell.h"
@interface SignInViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) SignInView *signView;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation SignInViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"购物车";
    self.signView = [[SignInView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    [self.view addSubview:self.signView];
    self.signView.ruleString = @"连续签到20天，每日50积分，然后每天签到100积分，若有一天未签到 ，重新从第一天开始算起。";
    [self.signView.signInButton addTarget:self action:@selector(signInButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.signView.collectionView.dataSource = self;
    self.signView.collectionView.delegate = self;
    [self.signView.collectionView registerClass:[SignInCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
}
#pragma mark 签到
- (void)signInButtonAction:(UIButton *)sender
{
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SignInCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
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
