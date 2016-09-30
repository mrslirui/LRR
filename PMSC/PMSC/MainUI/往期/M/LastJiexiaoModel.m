//
//  LastJiexiaoModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "LastJiexiaoModel.h"

@implementation LastJiexiaoModel

+(void)setjiexiaoWithId:(int)Id Withp:(int)p withblock:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"gid":[NSString stringWithFormat:@"%d",Id],@"p":[NSNumber numberWithInteger:p]} toHttpUrlStr:Publish isCacheorNot:NO targetViewController:self andUrlFunctionName:@"jiexiao" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSArray *arr = [[self class] modelHanderWithArray:responseObject[@"data"][@"data"]];
        NSLog(@"!!!!! %@",responseObject[@"data"][@"ptotal"]);

        block(arr,responseObject[@"data"][@"ptotal"]);

    } orFail:^(NSError *error) {
        
    }];
}
@end
