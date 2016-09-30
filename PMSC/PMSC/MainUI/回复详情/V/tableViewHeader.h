//
//  tableViewHeader.h
//  FriendRound
//
//  Created by 杨晓龙 on 16/8/19.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TitleAndImageView.h"
@interface tableViewHeader : UIView
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) NSString *contentString;
@property (nonatomic, strong) UIButton *rewardButton;
@property (nonatomic, strong) TitleAndImageView *voteButton;
@end
