//
//  ShopCarTableViewCell.h
//  PMSC
//
//  Created by 李锐 on 16/9/1.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCarTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *peopleCount;
@property(nonatomic,retain)UILabel *joinPeople;
@property(nonatomic,retain)UILabel *joinDate;

@property (nonatomic, strong) UIButton *buttonAdd;

@property (nonatomic, strong) UIButton *buttonSubtract;

@property (nonatomic, strong) UILabel *quantity;

@property (nonatomic, strong) UIButton *buttonAdd1;

@property (nonatomic, strong) UIButton *buttonSubtract1;

@property (nonatomic, strong) UILabel *quantity1;
@property(nonatomic,retain)UIButton *alertBtn;
@end
