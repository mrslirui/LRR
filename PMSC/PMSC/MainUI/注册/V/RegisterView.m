//
//  RegisterView.m
//  PMSC
//
//  Created by 李锐 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "RegisterView.h"

@interface RegisterView ()
#define ZI [UIScreen mainScreen].bounds.size.width / 360

@end
@implementation RegisterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViewsetup];
        self.backgroundColor  = RGBA(239, 239, 239, 1);
    }
    return self;
}
-(void)createViewsetup
{
    UIView *asd = [[UIView alloc] initWithFrame:CGRectMake(0, 21*kScreenHeight, Screen_WIDTH, 82*3*kScreenHeight)];
    [self addSubview:asd];
    asd.backgroundColor = [UIColor whiteColor];
    
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(20*kScreenWidth, 15*kScreenHeight, 45*kScreenHeight, 45*kScreenHeight)];
    img.image = [UIImage imageNamed:@"ren1@3x_1"];
    [asd addSubview:img];
    UIImageView *img1 = [[UIImageView alloc] initWithFrame:CGRectMake(20*kScreenWidth, 82*1*kScreenHeight+15*kScreenHeight, 45*kScreenHeight, 45*kScreenHeight)];
    img1.image = [UIImage imageNamed:@"tel1@3x_2"];
    [asd addSubview:img1];
    UIImageView *img2 = [[UIImageView alloc] initWithFrame:CGRectMake(20*kScreenWidth, 82*2*kScreenHeight+15*kScreenHeight, 45*kScreenHeight, 45*kScreenHeight)];
    img2.image = [UIImage imageNamed:@"suo1@3x_3"];
    [asd addSubview:img2];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(img1.right + 10*kScreenWidth, 0, 120*kScreenWidth, 82*kScreenHeight)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(img1.right + 10*kScreenWidth, 82*1*kScreenHeight, 120*kScreenWidth, 82*kScreenHeight)];
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(img1.right + 10*kScreenWidth, 82*2*kScreenHeight, 120*kScreenWidth, 82*kScreenHeight)];
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    [asd addSubview:label];
    [asd addSubview:label1];
    [asd addSubview:label2];

    label.text =@"手机号";
    label1.text = @"验证码";
    label2.text = @"密码";
    self.iphone = [[BaseTextField alloc] initWithFrame:CGRectMake(label.right+ 20*kScreenWidth,0,  Screen_WIDTH-105*kScreenWidth, 82*kScreenHeight)];
    _iphone.placeholder = @"输入手机号";
    [asd addSubview:_iphone];
    
    UIView *xian1=[[UIView alloc] initWithFrame:CGRectMake(0,82*kScreenHeight, Screen_WIDTH, 0.5)];
    xian1.backgroundColor = kHexColor(0xeaeaea);
    
    [asd addSubview:xian1];
    self.verification = [[BaseTextField alloc] initWithFrame:CGRectMake(label1.right+20*kScreenWidth,82*1*kScreenHeight,Screen_WIDTH-200*kScreenWidth, 82*kScreenHeight)];
    _verification.placeholder = @"输入验证码";
    [asd addSubview:_verification];
    
    UIView *xian=[[UIView alloc] initWithFrame:CGRectMake(0,82*kScreenHeight*2, Screen_WIDTH, 0.5)];
    xian.backgroundColor = kHexColor(0xeaeaea);
    [asd addSubview:xian];
    // 验证码
  self.yanzheng = [XLTimerButton buttonWithType:(UIButtonTypeCustom)];
    [self.yanzheng setImage:[UIImage imageNamed:@"获取验证码"] forState:0];
    self.yanzheng.frame = CGRectMake(self.right - 202*kScreenWidth, _verification.top, 182*kScreenWidth, 82*kScreenHeight);
    [asd addSubview:self.yanzheng];
    
    
    
   
    self.pass = [[BaseTextField alloc] initWithFrame:CGRectMake( label2.right+20*kScreenWidth, 82*2*kScreenHeight,400*kScreenWidth, 82*kScreenHeight)];
    _pass.placeholder = @"输入密码(六位数字或字母组合)";
    [asd addSubview:_pass];
    // 小眼睛按钮
    UIButton *yanjng = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [yanjng setImage:[UIImage imageNamed:@"r_eye_open"] forState:0];
    yanjng.frame = CGRectMake(self.right- 80*kScreenWidth, _pass.top+19*kScreenHeight, 48*kScreenWidth, 44*kScreenHeight);
    [asd addSubview:yanjng];
    [yanjng addTarget:self action:@selector(yanjingAction:) forControlEvents:(UIControlEventTouchUpInside)];
    
  self.comButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [self.comButton setImage:[UIImage imageNamed:@"完成"] forState:0];
    self.comButton.frame = CGRectMake(20*kScreenWidth,img2.bottom +200*kScreenHeight , 681*kScreenWidth, 74*kScreenWidth);
    [self addSubview:self.comButton];
    
     
    
    _iphone .font =[ UIFont systemFontOfSize:28*kScreenWidth];
     _verification .font =[ UIFont systemFontOfSize:28*kScreenWidth];
      _pass .font =[ UIFont systemFontOfSize:28*kScreenWidth];

     // 输入设置
    _pass.secureTextEntry = YES;
    _iphone.keyboardType = UIKeyboardTypeNumberPad;
    _verification.keyboardType = UIKeyboardTypeNumberPad;
    
    
}

-(void)yanjingAction:(UIButton*)button
{
    button.selected =! button.selected;
    if (button.selected) {
        _pass.secureTextEntry = YES;
        
    }else{
        _pass.secureTextEntry = NO;
        
    }
}

@end
