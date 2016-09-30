//
//  AdressModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AdressModel.h"

@implementation AdressModel
+(void)setWithId:(NSString *)Id withBLOCK:(ReturnValueBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"id":Id} toHttpUrlStr:AddressManager isCacheorNot:NO targetViewController:self andUrlFunctionName:@"dizhi" isValidate:NO success:^(id responseObject) {
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
