
//
//  HorseRacingHistoryViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HorseRacingHistoryViewController.h"
#import "XLFormView.h"
@interface HorseRacingHistoryViewController ()<XLFormViewDataSource,XLFormViewDelegate>
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) XLFormView *formView;
@end

@implementation HorseRacingHistoryViewController
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
    self.title = @"投注记录";
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
    self.scrollView.bounces = NO;
    
    [self.view addSubview:_scrollView];
    
    
    self.formView = [[XLFormView alloc] initWithFrame:CGRectMake(10, 30, CGRectGetWidth(self.view.frame) - 20, 0)];
    _formView.dataSource = self;
    _formView.delegate = self;
    [_scrollView addSubview:_formView];
    [self load];

}
- (void)load
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds), 15 * 40 + 60);
    });
}
- (NSInteger)numberOfRowsInFormView:(XLFormView *)formView
{
    return 15;
}
- (NSInteger)formViewColumnsInRow:(XLFormView *)formView
{
    return 7;
}
- (NSString *)formView:(XLFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (!row) {
        return self.titles[column];
    }else
    {
        switch (column) {
            case 0:
                return @"5";
                break;
            case 1:
                return @"冠亚军和";
                break;
            case 2:
                return @"大小";
                break;
            case 3:
                return @"大";
                break;
            case 4:
                return @"5";
                break;
            case 5:
                return @"小";
                break;
            default:
                return @"0";
                break;
        }
    }
}
- (UIColor *)formView:(XLFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (row == 0) {
        return kHexColor(0xcacaca);
    }
    return [UIColor whiteColor];
}
- (UIColor *)formView:(XLFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    return kHexColor(0x646464);
}
- (CGFloat)formView:(XLFormView *)formView heightForRow:(NSInteger)row
{
    return 40;
}
- (void)getEditArray:(NSArray *)editArray
{
    NSLog(@"%@",editArray);
}
- (BOOL)formView:(XLFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row
{
//    if (column == 6) {
//        return YES;
//    }
    return NO;
}
- (BOOL)getColumn:(NSInteger)column
{
//    if (column == 6) {
//        return YES;
//    }
    return NO;
}
- (CGFloat)formView:(XLFormView *)formView widthForColumn:(NSInteger)column
{
    if (column == 1) {
        return 60;
    }else
    {
        return (formView.bounds.size.width - 60) / 6.f;
    }
    
}
- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"期号",@"类别",@"小类别",@"预测",@"投注数",@"结果",@"收益"];
    }
    return _titles;
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
