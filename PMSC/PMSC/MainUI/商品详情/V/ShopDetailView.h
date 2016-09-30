//
//  ShopDetailView.h
//  PMSC
//
//  Created by 李锐 on 16/8/31.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRProgress.h"
#import "XLCycleScrollView.h"
typedef void(^ClickItem)(NSInteger index);
@interface ShopDetailView : UIView<XLCycleScrollViewDelegate>
@property(nonatomic,retain)UILabel *tiplabel;
@property(nonatomic,retain)UILabel *titleLb;
@property(nonatomic,retain)UILabel *total;
@property(nonatomic,retain)UILabel *retainLb;
@property(nonatomic,retain)LRProgress *progressView;
@property (nonatomic, strong) XLCycleScrollView *xlCycleScrollView;
@property (nonatomic, strong) NSArray *imagesURLStrings;/*** 轮播图信息 */
@property (nonatomic, copy) ClickItem click;

@property(nonatomic,retain)NSDictionary *detailDic;
@end
