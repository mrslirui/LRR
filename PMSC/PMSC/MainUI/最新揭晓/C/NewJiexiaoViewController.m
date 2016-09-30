//
//  NewJiexiaoViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewJiexiaoViewController.h"
#import "NewJiexiaoCollectionViewCell.h"
#import "NewJiexiaoView.h"
#import "NewJieTableViewCell.h"
#import "NewJiexiaoModel.h"
@interface NewJiexiaoViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,retain)NewJiexiaoView *nView;
@end

@implementation NewJiexiaoViewController
-(NewJiexiaoView *)nView
{
    if (!_nView) {
        _nView = [[NewJiexiaoView alloc] initWithFrame:self.view.bounds];
        self.nView.collectionView.dataSource = self;
        self.nView.collectionView.delegate  =self;
        self.nView.top.delegate =self;
    }
    return _nView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  self.navigationItem.title = @"最新揭晓";
    [self.view addSubview:self.nView];
        [_nView .collectionView registerClass:[NewJiexiaoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_nView. collectionView registerClass:[NewJieTableViewCell class] forCellWithReuseIdentifier:@"cell1"];
    _nView.backgroundColor = kHexColor(0xeeeeee);



}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        
    
    NewJiexiaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    }
    else
    {
        NewJieTableViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        return cell;
    }
}
- (void)PassOriginWithX:(CGFloat)x
{
    [_nView.collectionView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    // 把collectionView的位移传入TopScView中
    if([UIScreen mainScreen].bounds.size.width != 320)
    {
        [self.nView.top changeContentOffsetWithH:(_nView.collectionView.contentOffset.x + 82 )]
        ;
    }
    else{
        [self.nView.top changeContentOffsetWithH:(_nView.collectionView.contentOffset.x + 75 )];
        
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
