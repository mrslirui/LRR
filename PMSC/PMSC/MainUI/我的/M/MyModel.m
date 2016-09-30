//
//  MyModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "MyModel.h"

@implementation MyModel
+(void)setWithToken:(NSString *)token WithBlock:(ReturnBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"token":token} toHttpUrlStr:My isCacheorNot:NO targetViewController:self andUrlFunctionName:@"my" isValidate:NO success:^(id responseObject) {
        
        block(responseObject[@"data"]);
    } orFail:^(NSError *error) {
        
    }];
}
@end
