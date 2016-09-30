//
//  LoginView.m
//  yasin
//
//  Created by 李锐 on 16/5/23.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "LoginView.h"

@implementation LoginView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [ super initWithFrame:frame];
    if (self) {
        [self creatView];
    }
    return self;
    
}
-(void)creatView
{
    self.imgView = [UIImageView new];
    [self addSubview:_imgView];
    
    _imgView.image = [ UIImage imageNamed:@"登录图标"];
    _imgView.sd_layout
    .topSpaceToView(self,90  *kScreenHeight)
    .leftSpaceToView(self,200 *kScreenWidth)
    .widthIs(346 *kScreenWidth)
    .heightIs(132 *kScreenHeight);
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(120*kScreenWidth, 350 *kScreenHeight+10*kScreenHeight, 45*kScreenHeight, 45*kScreenHeight)];
    [self addSubview:img];
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(120*kScreenWidth, img.frame.origin.y+img.frame.size.height+30 *kScreenHeight, 45*kScreenHeight, 45*kScreenHeight)];
    [self addSubview:img1];
    
    img.image = [UIImage imageNamed:@"ren"];
    img1.image = [ UIImage imageNamed:@"suo@3x_1"];
    self.phoneField = [[ BaseTextField alloc] initWithFrame:CGRectMake(img.right+ 38*kScreenWidth, 350 *kScreenHeight, 488 *kScreenWidth, 60 *kScreenHeight)];
    self.phoneField .placeholder = @"输入手机号";
    _phoneField.font = [UIFont systemFontOfSize:30 *kScreenWidth];
    [self addSubview:self.phoneField];
    self.pswField = [[ BaseTextField alloc] initWithFrame:CGRectMake(img1.right+38 *kScreenWidth, self.phoneField.frame.origin.y+_phoneField.frame.size.height+30 *kScreenHeight, 488 *kScreenWidth, 60 *kScreenHeight)];
    self.pswField.placeholder = @"请输入密码";
    _pswField.font = [UIFont systemFontOfSize:30 *kScreenWidth];
    [self addSubview:_pswField];
    self.pswField.secureTextEntry = YES;
    self.login = [ UIButton buttonWithType:UIButtonTypeCustom];
    [self.login setImage:[UIImage imageNamed:@"登录@3x"] forState:UIControlStateNormal];
    
      [self addSubview:self.login];
    
    self.registerbtn = [ UIButton buttonWithType:UIButtonTypeCustom];
//    [self.registerbtn setTitle:@"手机注册" forState:UIControlStateNormal];
//    self.registerbtn.titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
//    [self.registerbtn setTitleColor:kAppColor forState:0];
//    self.registerbtn.layer.borderColor = kAppColor.CGColor;
//    self.registerbtn.layer.borderWidth = 1;
    [self.registerbtn setImage:[UIImage imageNamed:@"手机注册@3x"] forState:UIControlStateNormal];
    [self addSubview:self.registerbtn];
  
     self.wxButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.wxButton setBackgroundImage:[UIImage imageNamed:@"loginwechat@3x_2"] forState:UIControlStateNormal];
    [self addSubview:self.wxButton];
    
    
    self.forgetPsw = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetPsw.frame = CGRectMake(self.right - 224*kScreenWidth, _pswField.bottom+30*kScreenHeight, 100, 50*kScreenHeight) ;
    [self addSubview:_forgetPsw];
    [_forgetPsw setTitle:@"忘记密码?" forState:0];
    
    [_forgetPsw setTitleColor:[UIColor blackColor] forState:0];
    _forgetPsw.titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
    
    _login.sd_layout
    .topSpaceToView(self.pswField,115 *kScreenHeight)
    .leftSpaceToView(self,117 *kScreenWidth)
    .rightSpaceToView(self,116 *kScreenWidth)
    .heightIs(75 *kScreenWidth);
    _registerbtn.sd_layout
    .topSpaceToView(self.login,42 *kScreenHeight)
    .leftEqualToView(_login)
    .rightEqualToView(_login)
    .heightIs(75 *kScreenWidth);
    
  
    
    UIView *line1 = [UIView new];
    [self addSubview:line1];
    line1.backgroundColor = RGBA(239, 239, 239, 1);
    
    UIView *line2 = [UIView new];
    [self addSubview:line2];
    line2.backgroundColor = RGBA(239, 239, 239, 1);
    
    line1.sd_layout
    .topSpaceToView(self.phoneField,1*kScreenHeight)
    .leftEqualToView(img)
    .widthRatioToView(self.phoneField,1)
    .heightIs(1);
    line2.sd_layout
    .topSpaceToView(self.pswField,1 *kScreenHeight)
    .leftEqualToView(img1)
    .widthRatioToView(self.pswField,1)
    .heightIs(1);
    
    
    UILabel *morelb= [UILabel new];
    [self addSubview:morelb];
    morelb.text = @"更多方式登录";
    morelb.textColor = [UIColor lightGrayColor];
    morelb.font = [UIFont systemFontOfSize:30*kScreenWidth];
    morelb.sd_layout
    .topSpaceToView(_registerbtn,50*kScreenHeight)
    .leftSpaceToView(self,270*kScreenWidth)
    .widthIs(300 *kScreenWidth)
    .heightIs(50*kScreenHeight);

    self.wxButton.sd_layout
    .topSpaceToView(morelb,20 * kScreenHeight)
    .leftSpaceToView(self,314 * kScreenWidth)
    .widthIs(90 * kScreenWidth)
    .heightIs(90 * kScreenWidth);

}
@end
