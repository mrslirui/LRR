//
//  ZhongjiangModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ZhongjiangModel.h"

@implementation ZhongjiangModel

+(void)setWithType:(int)type Withname:(NSString *)uname withBlock:(ZhongjiangBLock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"type":[NSNumber numberWithInt:type],@"token":uname} toHttpUrlStr:@"http://gangmaduobao.com/?/api/order/od" isCacheorNot:NO targetViewController:self andUrlFunctionName:@"zjsh" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *arr = [[self class] modelHanderWithArray:responseObject[@"data"]];
        block(arr);
    } orFail:^(NSError *error) {
        
    }];
}
@end
