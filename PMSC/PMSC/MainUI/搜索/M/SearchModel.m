//
//  SearchModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SearchModel.h"

@implementation SearchModel
+(void)setSearchWithKey:(NSString *)key WithP:(int)p WithBLOCK:(ReturnValueBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"keys":key,@"p":[NSNumber numberWithInt:p]} toHttpUrlStr:Search isCacheorNot:NO targetViewController:self andUrlFunctionName:@"search" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"][@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
        }
        block(arr,responseObject[@"data"][@"ptotal"]);
    } orFail:^(NSError *error) {
        
    }];
}
@end
