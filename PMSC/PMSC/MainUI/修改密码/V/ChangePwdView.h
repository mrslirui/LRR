//
//  ChangePwdView.h
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTextField.h"
@interface ChangePwdView : UIView
@property(nonatomic,retain)UIView *bgView;
@property(nonatomic,retain)BaseTextField *textField;
@property(nonatomic,retain)BaseTextField *nPswText;
@property(nonatomic,retain)BaseTextField *confirmPswText;
@property(nonatomic,retain)UIButton *eyebtn;
@property(nonatomic,retain)UIButton *eyebtn1;
@property(nonatomic,retain)UIButton *DoneBtn;
@end
