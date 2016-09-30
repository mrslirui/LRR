//
//  FindViewModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "FindViewModel.h"

@implementation FindViewModel
+ (void)setFindViewP:(int)p block:(BLOCK)block
{
    NSDictionary *dic;
    if (TOKEN == nil) {
        dic = @{@"p":[NSNumber numberWithInt:p]};
    }else
    {
        dic = @{@"p":[NSNumber numberWithInt:p],@"token":TOKEN};
    }
    [xl_HttpManager httpManagerPostParameter:dic toHttpUrlStr:PostList isCacheorNot:YES targetViewController:self andUrlFunctionName:@"faxian" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        
        block(responseObject[@"data"]);
    } orFail:^(NSError *error) {
        
    }];
}
+ (void)setReward:(int)ID block:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"id":[NSNumber numberWithInt:ID],@"token":TOKEN} toHttpUrlStr:Shang isCacheorNot:NO targetViewController:self andUrlFunctionName:@"shang" isValidate:YES success:^(id responseObject) {
        block();
    } orFail:^(NSError *error) {
        
    }];
}
@end
