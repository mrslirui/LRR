//
//  BaseMessageModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseMessageModel.h"

@implementation BaseMessageModel

+(void)setWithtoken:(NSString *)token WithBlock:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"token":token} toHttpUrlStr:BaseMessage isCacheorNot:NO targetViewController:self andUrlFunctionName:@"jibenxinxi" isValidate:YES success:^(id responseObject) {
        block(responseObject[@"data"]);
    } orFail:^(NSError *error) {
        
    }];
}
@end
