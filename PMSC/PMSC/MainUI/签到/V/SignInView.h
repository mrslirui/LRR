//
//  SignInView.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignInView : UIView
@property (nonatomic, strong) UILabel *dayNumberLabel;
@property (nonatomic, strong) UIButton *signInButton;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) NSString *ruleString;
@end
