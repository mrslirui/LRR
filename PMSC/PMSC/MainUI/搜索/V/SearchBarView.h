//
//  SearchBarView.h
//  PMSC
//
//  Created by 李锐 on 16/9/8.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SKTagView.h"
@interface SearchBarView : UIView
@property(nonatomic,retain)UILabel *label;

@property(nonatomic,retain)UILabel *label1;
@property(nonatomic,retain)SKTagView *tagView;//历史搜索
@property(nonatomic,retain)SKTagView *tagView1; //热门搜索
@property(nonatomic,retain)NSMutableArray *dataArr;
@property(nonatomic,retain)NSMutableArray *dataArr1;
@end
