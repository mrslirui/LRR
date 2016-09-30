//
//  HelpCollectionViewCell.h
//  PMSC
//
//  Created by 李锐 on 16/9/7.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelpModel.h"
typedef void(^QUESTIONBLOCK)(NSString  *qid);//传问题id
@interface HelpCollectionViewCell : UICollectionViewCell<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)UITableView *tableView;
@property(nonatomic,assign)NSInteger type;
@property(nonatomic,retain)UIButton *tiwenBtn;
@property(nonatomic,copy)QUESTIONBLOCK Qblock;

@property(nonatomic,retain)NSMutableArray *hArr;
@property(nonatomic,retain)NSMutableArray *mArr;
@end
