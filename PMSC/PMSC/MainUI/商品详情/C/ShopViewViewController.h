//
//  ShopViewViewController.h
//  PMSC
//
//  Created by 李锐 on 16/8/31.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseViewController.h"

@interface ShopViewViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,retain)UIButton *rightNowDuobao;
@property(nonatomic,retain)UIButton *addCarBtn;
@property(nonatomic,retain)UIButton *shopCarBtn;
@property(nonatomic,retain)NSString *sId;
@end
