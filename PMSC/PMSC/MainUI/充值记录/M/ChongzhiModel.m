//
//  ChongzhiModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChongzhiModel.h"

@implementation ChongzhiModel
+(void)setWithUid:(NSString *)uid WithBLock:(PaylogBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"token":uid} toHttpUrlStr:Paylog isCacheorNot:NO targetViewController:self andUrlFunctionName:@"paylog" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        block(responseObject);
        
    } orFail:^(NSError *error) {
        
    }];
}
@end
