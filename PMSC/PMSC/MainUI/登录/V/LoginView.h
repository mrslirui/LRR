//
//  LoginView.h
//  yasin
//
//  Created by 李锐 on 16/5/23.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginView : UIView
@property(nonatomic,retain)UIImageView *imgView;
@property(nonatomic,retain)BaseTextField *phoneField;
@property(nonatomic,retain)BaseTextField *pswField;
@property(nonatomic,retain)UIButton *login;
@property(nonatomic,retain)UIButton *registerbtn;
@property(nonatomic,retain)UIButton *forgetPsw;
@property (nonatomic, strong) UIButton *wxButton;
@end
