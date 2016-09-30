//
//  SearchView.m
//  PMSC
//
//  Created by 李锐 on 16/9/6.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SearchView.h"

@implementation SearchView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self searchView]; //调用searchView方法
    }
    return self;
}

#pragma mark 实现searchView方法
-(void)searchView
{
    self.placeholder = @"搜索商品";
    self.font = [UIFont systemFontOfSize:28*kScreenHeight];
    //设置textField的样式
    self.borderStyle = UITextBorderStyleRoundedRect;
    //设置键盘的return键 的样式 我们更改为search字样
    self.returnKeyType = UIReturnKeySearch;
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60*kScreenHeight, self.height)];
//    rightVeiw.backgroundColor =[UIColor redColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake (10*kScreenWidth, 10*kScreenHeight, 40*kScreenHeight, 40*kScreenHeight)];
//    imageView.backgroundColor = [UIColor orangeColor];
    [leftView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"tabbar_discover@3x"];
   
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
//    //向 这张图片添加一个手势
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(btnClick:)];
//    [imgView addGestureRecognizer:tap];
    self.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    
}
//实现按钮点击事件
-(void)btnClick:(UIButton *)btn
{
    NSLog(@" 111111111111%@",self.text);
    NSLog(@"5555");
}
@end
