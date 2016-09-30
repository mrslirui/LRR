//
//  ShowCollectionViewCell.h
//  yasin
//
//  Created by 杨晓龙 on 16/5/27.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCollectionViewCell : UICollectionViewCell
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UILabel *title;
@property(nonatomic,retain)UILabel *total;
@property(nonatomic,retain)UILabel *valueLb;
@property (nonatomic, strong) UIButton *buttonAdd;

@property (nonatomic, strong) UIButton *buttonSubtract;

@property (nonatomic, strong) UILabel *quantity;
@property(nonatomic,retain)UIImageView *quantityImg;
@end
