//
//  FindTableViewCell.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleAndImageView.h"
#import "FindViewModel.h"
@interface FindTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *typeImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *insMessageLabel;
@property (nonatomic, strong) UILabel *timeAndNameLabel;
@property (nonatomic, strong) UIButton *shangButton;
@property (nonatomic, strong) TitleAndImageView *voteButton;
@property (nonatomic, strong) FindViewModel *findM;
@end
