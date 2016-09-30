//
//  ZhongjiangViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ZhongjiangViewController.h"
#import "ZhongjiangView.h"
#import "ZhongjiangCollectionViewCell.h"
#import "PostShaidanViewController.h"
@interface ZhongjiangViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UIScrollViewDelegate>
@property(nonatomic,retain)ZhongjiangView *dView;
@property (nonatomic, retain)UIView *scrollLine;
@end

@implementation ZhongjiangViewController
-(ZhongjiangView *)dView
{
    if (!_dView) {
        self.dView = [[ZhongjiangView alloc] initWithFrame:self.view.bounds];
        self.dView .collectionView.delegate = self;
        self.dView .collectionView.dataSource = self;
        
        
        
    }
    return _dView;
}
- (UIView *)scrollLine
{
    if (!_scrollLine)
    {
        _scrollLine = [[UIView alloc] initWithFrame:CGRectMake(0, 104*kScreenHeight, self.view.frame.size.width/3, 2)];
        _scrollLine.backgroundColor = kAppColor;
    }
    return _scrollLine;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"中奖收货";
    [self.dView.firstBtn setTitle:@"未发货" forState:0];
    [self.dView.sencondBtn setTitle:@"已发货" forState:0];
    [self.dView.thirdBtn setTitle:@"已收货" forState:0];

    [self.dView.bgView addSubview:self.scrollLine];
    [self.view addSubview:self.dView];
    [self.dView.collectionView registerClass:[ZhongjiangCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.dView.collectionView registerClass:[ZhongjiangCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.dView.collectionView registerClass:[ZhongjiangCollectionViewCell class] forCellWithReuseIdentifier:@"cell2"];
    
    [self.dView.firstBtn addTarget:self action:@selector(firstbutton:) forControlEvents:UIControlEventTouchUpInside];
    [self.dView.sencondBtn addTarget:self action:@selector(secondbutton:) forControlEvents:UIControlEventTouchUpInside];
    [self.dView.thirdBtn addTarget:self action:@selector(thirdbutton:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 3;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        ZhongjiangCollectionViewCell *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type =1;
               return cell;
    }
    else if (indexPath.row == 1)
    {
        ZhongjiangCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.type =2;
        return cell;
        
    }
    else
    {
        ZhongjiangCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell2" forIndexPath:indexPath];
        cell.type =3;
        cell.clickBtn = ^(void)
        {
            [self.navigationController pushViewController:[PostShaidanViewController new] animated:YES];
        };

        return cell;
        
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offx = scrollView.contentOffset.x;
    CGFloat linex = (Screen_WIDTH *2 / 3.0 ) * (offx / (Screen_WIDTH * 2));
    self.scrollLine.frame = CGRectMake(0 + linex, 104*kScreenHeight, Screen_WIDTH /3, 2);
    if (offx < Screen_WIDTH / 2.0)
    {
        [self.dView.firstBtn setTitleColor:kAppColor forState:UIControlStateNormal];
        [self.dView.sencondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.dView.thirdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (offx > Screen_WIDTH / 2.0 &&(offx < 3 / 2.0 * Screen_WIDTH))
    {
        [self.dView.firstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.dView.sencondBtn setTitleColor:kAppColor forState:UIControlStateNormal];
        [self.dView.thirdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    if (offx > 3 / 2.0 * Screen_WIDTH)
    {
        [self.dView.firstBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.dView.sencondBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.dView.thirdBtn setTitleColor:kAppColor forState:UIControlStateNormal];
        
    }
    
}

-(void)firstbutton:(UIButton *)sender
{
    [self.dView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
-(void)secondbutton:(UIButton *)sender
{
    [self.dView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
}
-(void)thirdbutton:(UIButton *)sender
{
    [self.dView.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:2 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:YES];
    
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
