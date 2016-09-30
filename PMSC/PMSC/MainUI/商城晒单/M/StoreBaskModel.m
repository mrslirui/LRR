//
//  StoreBaskModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "StoreBaskModel.h"

@implementation StoreBaskModel
+ (void)setStoreBaskP:(int)p id:(NSString *)ID block:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"gid":[NSNumber numberWithInt:[@"1" intValue]],@"p":[NSNumber numberWithInt:p]} toHttpUrlStr:GoodShare isCacheorNot:NO targetViewController:self andUrlFunctionName:@"shangpinshaidan" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary * dic in responseObject[@"data"][@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
        }
        block(arr);
    } orFail:^(NSError *error) {
        
    }];
}
@end
