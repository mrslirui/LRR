//
//  DuobaoModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DuobaoModel.h"

@implementation DuobaoModel
+(void)setWithType:(int)type WithToken:(NSString *)token WithBlock:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"type":[NSNumber numberWithInt:type],@"token":token} toHttpUrlStr:Snatch isCacheorNot:NO targetViewController:self andUrlFunctionName:@"duobao" isValidate:NO success:^(id responseObject) {
        NSArray *arr = [[self class] modelHanderWithArray:responseObject[@"data"]];
        
        block(arr);
        
        NSLog(@"%@",responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
