//
//  AddTableViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddTableViewCell.h"

@implementation AddTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle: style reuseIdentifier:reuseIdentifier];
    if (self ) {
        self.textView = [[UITextView alloc] init];
        [self.contentView addSubview:_textView];
        _textView.font = [UIFont systemFontOfSize:30 *kScreenHeight];
        [self backKeyboard];
    }
    return  self;
}
-(void)layoutSubviews
{ [ super layoutSubviews];
    self.textView.frame = CGRectMake(0, 0, self.contentView.size.width, 251*kScreenHeight);
}
- (void)backKeyboard
{
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    topView.tag = 10001;
    UIBarButtonItem * btnSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(2, 5, 50, 25);
    [btn addTarget:self action:@selector(dismissKeyBoard) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"完成" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:0.0863 green:0.5216 blue:0.8392 alpha:1.0] forState:UIControlStateNormal];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithCustomView:btn];
    NSArray * buttonsArray = [NSArray arrayWithObjects:btnSpace, doneBtn,nil];
    [topView setItems:buttonsArray];
    [self.textView setInputAccessoryView:topView];
    
}
-(void)dismissKeyBoard
{
    NSLog(@"~~~");
    UIToolbar *tao = [self viewWithTag:10001];
    [tao removeFromSuperview];
    [self.textView resignFirstResponder];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
