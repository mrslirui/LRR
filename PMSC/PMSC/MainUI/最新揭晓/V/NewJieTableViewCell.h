//
//  NewJieTableViewCell.h
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewJieTableViewCell : UICollectionViewCell<UICollectionViewDataSource,UICollectionViewDelegate>
@property(nonatomic,retain)UICollectionView *collectionView;
@end
