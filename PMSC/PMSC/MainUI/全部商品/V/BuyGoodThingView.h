//
//  BuyGoodThingView.h
//  yasin
//
//  Created by 杨晓龙 on 16/5/27.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ClickItem)(NSInteger index);
@interface BuyGoodThingView : UIView
@property (nonatomic, strong) UIView *shopShowView;
@property (nonatomic, strong) UIView *myHView;
@property (nonatomic, strong) UITableView *listTableView;
@property (nonatomic, strong) UICollectionView *showCollectionView;
@property (nonatomic, strong) UILabel *countLabel;
@property (nonatomic, strong) NSArray *imagesURLStrings;
@property (nonatomic, copy) ClickItem click;
@end
