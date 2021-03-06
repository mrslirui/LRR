//
//  NewJiexiaoView.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewJiexiaoView.h"

@interface NewJiexiaoView ()

@end
@implementation NewJiexiaoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}

-(void)creatView
{
    self.top =[[TopScView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width ,70 *kScreenHeight)];
    
    self.top.dataArr = @[@"开奖等待",@"最新揭晓"].mutableCopy;
     [self addSubview:self.top];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height - 70 *kScreenHeight);
    flow.minimumLineSpacing = 0;
    flow.minimumInteritemSpacing = 0;
    flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 70 *kScreenHeight, self.frame.size.width, self.frame.size.height - 70 *kScreenHeight) collectionViewLayout:flow];
    _collectionView.backgroundColor = [UIColor whiteColor];
      _collectionView.pagingEnabled = YES;
    [self addSubview:_collectionView];
    _collectionView.bounces = NO;
    
    
}





@end
