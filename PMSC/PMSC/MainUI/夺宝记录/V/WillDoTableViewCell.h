//
//  WillDoTableViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LRProgress.h"
@interface WillDoTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *imgView;

@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)LRProgress *progressView;
@property(nonatomic,retain)UILabel *valueLabel;

@property(nonatomic,retain)NSString *progressStr;
@property(nonatomic,assign)CGFloat pro;
@end
