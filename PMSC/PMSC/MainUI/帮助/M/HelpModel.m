//
//  HelpModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HelpModel.h"

@implementation HelpModel

+(void)setWithType:(int)type withuserId:(NSString *)Uid withBlock:(BLOCK)block
{
    NSLog(@"%@",@{@"type":[NSString stringWithFormat:@"%d", type],@"uid":[NSString stringWithFormat:@"%@", Uid]});
    
    
    [xl_HttpManager httpManagerPostParameter:@{@"type":[NSNumber numberWithInt:type],@"uid":Uid} toHttpUrlStr:Help isCacheorNot:NO targetViewController:self andUrlFunctionName:@"help" isValidate:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
            
        }
        
        
        block(arr);
    } orFail:^(NSError *error) {
        
    }];
}

@end
