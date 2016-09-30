//
//  PersonViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PersonViewController.h"
#import "PersonView.h"
#import "BaseMessageModel.h"
@interface PersonViewController ()
@property(nonatomic,retain)PersonView *pView;
@end

@implementation PersonViewController

-(PersonView *)pView
{
    if (!_pView) {
        _pView = [[PersonView alloc] initWithFrame:self.view.bounds];
    }
    return _pView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置";
    [self.view addSubview:self.pView];
    [self loadata];
}
-(void)loadata
{
 [BaseMessageModel setWithtoken:TOKEN WithBlock:^(id value) {
//     self.pView.name.text = value[@"username"];
     self.pView.sex.text =[NSString stringWithFormat:@"%@",value[@"sex"]];
     [self.pView.head sd_setImageWithURL:[NSURL URLWithString:value[@"img"]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
     self.pView.nameStr =value[@"username"];
 }];
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
