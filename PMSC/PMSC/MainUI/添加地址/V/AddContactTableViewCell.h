//
//  AddContactTableViewCell.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextField.h"
@interface AddContactTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UILabel *contLb;
@property(nonatomic,retain) BaseTextField*phone;
@property(nonatomic,retain)UIButton *arrBtn;
@end
