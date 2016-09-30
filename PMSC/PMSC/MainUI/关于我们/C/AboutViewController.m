//
//  AboutViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/3.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AboutViewController.h"
#import "AboutView.h"
#import "AboutModel.h"
@interface AboutViewController ()
@property(nonatomic,retain)AboutView *aview;
@end

@implementation AboutViewController

-(AboutView *)aview
{
    if (!_aview) {
        _aview = [[AboutView alloc] initWithFrame:self.view.bounds];
    }
    return _aview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.aview];
    self.navigationItem.title  = @"关于我们";
    [AboutModel setBlockWithBlock:^(id returnValue) {
       
        _aview.dic = returnValue;
        NSLog(@"%@",_aview.dic);
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
