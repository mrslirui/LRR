//
//  HeadCollectionReusableView.h
//  PMSC
//
//  Created by 李锐 on 16/8/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLCycleScrollView.h"
#import "GBView.h"

typedef void(^ClickItem)(NSInteger index);
typedef void(^ClickCount)(NSInteger index);

@interface HeadCollectionReusableView : UICollectionReusableView<XLCycleScrollViewDelegate>
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UICollectionView *kindCollectionView;
@property(nonatomic,retain)UILabel *messageLabel;
@property(nonatomic,retain)UIButton *arrow;
@property (nonatomic, strong) XLCycleScrollView *xlCycleScrollView;
@property (nonatomic, strong) NSArray *imagesURLStrings;/*** 轮播图信息 */
@property (nonatomic, copy) ClickItem click;
@property (nonatomic, copy) ClickCount click1;
@property(nonatomic,retain)GBView *gbView; //广播
@property(nonatomic,retain)NSMutableArray *gbArr; //广播数组
@property(nonatomic,retain)NSMutableArray *lunboArr;
@end
