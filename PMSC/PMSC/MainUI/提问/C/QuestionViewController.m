//
//  QuestionViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "QuestionViewController.h"

@interface QuestionViewController ()<UITextViewDelegate>
@property(nonatomic,retain)UITextView *textView;
@end

@implementation QuestionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self load];
    [self backKeyboard];
    self.view.backgroundColor  =RGBA(239, 239, 239, 1);
    self.navigationItem.title =@"提问";
}
-(void)load
{
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 21*kScreenHeight, Screen_WIDTH, 557*kScreenHeight)];
    [self.view addSubview:_textView];
    _textView.text = @"亲,有什么问题尽管提哦!";
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.font = [UIFont systemFontOfSize:32*kScreenWidth];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(20*kScreenWidth, _textView.bottom + 50*kScreenHeight, Screen_WIDTH - 40*kScreenWidth, 70*kScreenHeight);
    
    [btn setTitle:@"提交" forState:0];
    btn.backgroundColor = kAppColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
    _textView.delegate  =self;

    
}
-(void)button
{
    //提交
    NSLog(@"%@",_textView.text);
    [xl_HttpManager httpManagerPostParameter:@{@"uid":TOKEN  ,@"issue":_textView.text} toHttpUrlStr:Question isCacheorNot:NO targetViewController:self andUrlFunctionName:@"tiwen" isValidate:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        [ AlertAndActionTool  showCancleAlertWith:@"提示" AndContent:@"确定" AndViewController:self AndCallBack:^{
            [self.navigationController popViewControllerAnimated:YES];
        }];
    } orFail:^(NSError *error) {
        
    }];
}
#pragma mark - textView的协议方法
- (void)textViewDidChange:(UITextView *)textView
{
    //记录输入的字数
   }
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    _textView.text= @"";
   _textView.textColor = [UIColor blackColor];
    _textView.font = [UIFont systemFontOfSize:30*kScreenWidth];
}
-(void)textViewDidEndEditing:(UITextView *)textView
{ if(_textView.text.length == 0)
{
    
        _textView.text = @"亲,有什么问题尽管提哦!";
    
    }
    
    
else
{
     _textView.textColor = [UIColor blackColor];
}
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
    UIToolbar *tao = [self.textView viewWithTag:10001];
    [tao removeFromSuperview];
    [self.textView resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
