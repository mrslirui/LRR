//
//  BuyGoodThingView.m
//  yasin
//
//  Created by 杨晓龙 on 16/5/27.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "BuyGoodThingView.h"

@implementation BuyGoodThingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
    }
    return self;
}

- (void)load
{
  
    
       
    self.listTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, 145*kScreenWidth, Screen_HEIGHT) style:UITableViewStylePlain];
    [self addSubview:self.listTableView];
    
    
    CGFloat width = CGRectGetWidth(self.frame) - 145 * kScreenWidth;
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake((width / 2) - 0.6 * kScreenWidth, 477 * kScreenHeight);
    flow.minimumInteritemSpacing = 1 * kScreenWidth;
    flow.minimumLineSpacing = 1 * kScreenWidth;
    self.showCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(145*kScreenWidth, 20,width, Screen_HEIGHT-64) collectionViewLayout:flow];
    [self addSubview:self.showCollectionView];
    _showCollectionView.backgroundColor =  kHexColor(0xeeeeee);
    _shopShowView.backgroundColor =  kHexColor(0xeeeeee);
    
//    flow.headerReferenceSize = CGSizeMake(self.frame.size.width, 886*kScreenHeight);
    
    
    
}

@end
