//
//  QuestionDetailViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "QuestionDetailViewController.h"
#import "QuestionDetailModel.h"
@interface QuestionDetailViewController ()
@property(nonatomic,retain)NSString *questStr;
@property(nonatomic,retain)NSString *answerStr;
@end

@implementation QuestionDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"问题详情";
    
    NSLog(@"%@", self.qId);
    [QuestionDetailModel setWithId:[self.qId intValue] withBlock:^(id value) {
        NSLog(@"%@",value);
        self.questStr = value[@"issue"];
        self.answerStr = value[@"reply"];
        [self load];
    }];
}
-(void)load
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(21*kScreenWidth, 0, Screen_WIDTH, 80*kScreenHeight)];
    [self.view addSubview:label];
    
    label.text = [NSString stringWithFormat:@"Q: %@",_questStr];
    label.textColor = kAppColor;
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(label.left, label.bottom , 15, 30*kScreenHeight)];
    label1.text = @"A:";
    [self.view addSubview:label1];
    label1.textColor = kHexColor(0x707070);
    label.font  =[ UIFont systemFontOfSize:30*kScreenWidth];
    label1.font  =[ UIFont systemFontOfSize:30*kScreenWidth];
    UILabel *answer =[ UILabel new];
    [self.view addSubview:answer];
    answer.textColor = kHexColor(0x707070);
    answer.font  =[ UIFont systemFontOfSize:30*kScreenWidth];
    answer.text = _answerStr;
    answer.sd_layout
    .topEqualToView(label1)
    .leftSpaceToView(label1,10*kScreenWidth)
    .rightSpaceToView(self.view,20*kScreenWidth)
    .autoHeightRatio(0);

    
}
-(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:30 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(530 * kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
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
