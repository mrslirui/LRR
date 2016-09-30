//
//  ChangePwdView.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangePwdView.h"

@implementation ChangePwdView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
}
-(void)creatView
{
    

    self.bgView = [UIView new];
    [self addSubview:_bgView];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(20 *kScreenWidth, 0, 140*kScreenWidth, 82*kScreenHeight)];
    [self.bgView addSubview:label1];
    UILabel *label2 =[[ UILabel alloc] initWithFrame:CGRectMake(20 *kScreenWidth, label1.bottom, label1.width, label1.height)];
    [self.bgView addSubview:label2];
    UILabel *label3= [[ UILabel alloc] initWithFrame:CGRectMake(20 *kScreenWidth, label2.bottom, label1.width, label1.height)];
    [self.bgView addSubview:label3];
    label3.text = @"确认密码";
    label1.text = @"原密码";
    label2.text = @"新密码";
    
    self.textField = [BaseTextField new];
    [self.bgView addSubview:_textField];
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.nPswText =[ BaseTextField new];
    [self.bgView addSubview:_nPswText];
    self.nPswText.keyboardType = UIKeyboardTypeDefault;
    self.confirmPswText = [BaseTextField new];
    [self.bgView addSubview:_confirmPswText];
    self.confirmPswText.keyboardType = UIKeyboardTypeDefault;
    
    self.eyebtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:_eyebtn];
    self.eyebtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.bgView addSubview:_eyebtn1];
    [self.eyebtn setImage:[UIImage imageNamed:@"r_eye_open"] forState:0];
    [self.eyebtn1 setImage:[UIImage imageNamed:@"r_eye_open"] forState:0];
    UIView *line=[ UIView new];
    [self.bgView addSubview:line];
    line.backgroundColor =  kHexColor(0xeaeaea);
    UIView *line1=[ UIView new];
    [self.bgView addSubview:line1];
    line1.backgroundColor =  kHexColor(0xeaeaea);
    _textField.placeholder = @"输入原密码";
    
    _nPswText.placeholder = @"输入新密码";
    _confirmPswText.placeholder = @"输入密码(6位数字或字母组合)";
    _textField.font = [UIFont systemFontOfSize:30*kScreenWidth];
    _nPswText.font = [UIFont systemFontOfSize:30*kScreenWidth];
    _confirmPswText.font = [UIFont systemFontOfSize:30*kScreenWidth];
    
    self.bgView. backgroundColor = [UIColor whiteColor];
    self. backgroundColor = kHexColor(0xeeeeee);
    self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.nPswText.secureTextEntry= YES;
    self.confirmPswText.secureTextEntry = YES;
    _bgView.sd_layout
    .topSpaceToView(self,10)
    .leftSpaceToView(self,0)
    .rightSpaceToView(self,0)
    .heightIs(246 *kScreenHeight);
    _textField.sd_layout
    .topSpaceToView(self.bgView, 0)
    .leftSpaceToView(label1,30 *kScreenWidth)
    .rightSpaceToView(self.bgView,44 *kScreenWidth)
    .heightIs(82 *kScreenHeight);
    line.sd_layout
    .topSpaceToView(_textField,0)
    .leftEqualToView(_textField)
    .rightEqualToView(_textField)
    .heightIs(0.5);
    
    self.nPswText.sd_layout
    .topSpaceToView(line, 0)
    .leftSpaceToView(label2,30 *kScreenWidth)
    .rightSpaceToView(self.bgView,44 *kScreenWidth)
    .heightIs(82 *kScreenHeight);
    line1.sd_layout
    .topSpaceToView(_nPswText,0)
    .leftEqualToView(_textField)
    .rightEqualToView(_textField)
    .heightIs(0.5);
    self.confirmPswText.sd_layout
    .topSpaceToView(line1 ,0)
    .leftEqualToView(_nPswText)
    .rightEqualToView(_nPswText)
    .heightIs(82 *kScreenHeight);
    self.eyebtn.sd_layout
    .topSpaceToView(line,21*kScreenHeight)
    .rightSpaceToView(self.bgView,44 *kScreenWidth)
    .widthIs(48 *kScreenWidth)
    .heightIs(44 *kScreenWidth);
    
    self.eyebtn1.sd_layout
    .topSpaceToView(line1,21*kScreenHeight)
    .rightSpaceToView(self.bgView,44 *kScreenWidth)
    .widthIs(48 *kScreenWidth)
    .heightIs(44 *kScreenWidth);
    label1.font = [UIFont systemFontOfSize:30*kScreenWidth];
    label2.font = [UIFont systemFontOfSize:30*kScreenWidth];
    label3.font = [UIFont systemFontOfSize:30*kScreenWidth];
    label3.textAlignment = NSTextAlignmentCenter;
    label2.textAlignment = NSTextAlignmentCenter;
    label1.textAlignment = NSTextAlignmentCenter;
    self.DoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.DoneBtn setTitle:@"完成" forState:UIControlStateNormal];
    self.DoneBtn.backgroundColor = kAppColor;
    [_DoneBtn setTitleColor:[UIColor whiteColor] forState:0];
    
    _DoneBtn.frame = CGRectMake((720 - 674) *kScreenWidth /2, _bgView.bottom + 200*kScreenHeight, 674*kScreenWidth, 73*kScreenHeight);
    [self addSubview:_DoneBtn];
    [self.eyebtn addTarget:self action:@selector(xianshimima:) forControlEvents:UIControlEventTouchUpInside];
    [self.eyebtn1 addTarget:self action:@selector(xianshimima1:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)xianshimima:(UIButton *)btn
{ btn.selected =! btn.selected;
    if (btn.selected) {
        _nPswText.secureTextEntry = NO;
    }
    else{
        _nPswText.secureTextEntry = YES;
    }
}
-(void)xianshimima1:(UIButton *)btn
{ btn.selected =! btn.selected;
    if (btn.selected) {
        _confirmPswText.secureTextEntry = NO;
    }
    else{
        _confirmPswText.secureTextEntry = YES;
    }
}

@end
