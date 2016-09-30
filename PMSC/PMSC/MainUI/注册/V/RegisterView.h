//
//  RegisterView.h
//  PMSC
//
//  Created by 李锐 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterView : UIView
@property (nonatomic, retain) BaseTextField *iphone;
@property (nonatomic, retain) BaseTextField *verification;
@property (nonatomic, retain) BaseTextField *pass;
@property(nonatomic,retain)XLTimerButton *yanzheng;
@property(nonatomic,retain)UIButton *comButton;

@end
