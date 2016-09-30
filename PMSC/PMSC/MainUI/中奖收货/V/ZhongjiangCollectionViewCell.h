//
//  ZhongjiangCollectionViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BLOCK)(void);
@interface ZhongjiangCollectionViewCell : UICollectionViewCell
@property(nonatomic,assign)int type;
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,copy)BLOCK clickBtn;
@end
