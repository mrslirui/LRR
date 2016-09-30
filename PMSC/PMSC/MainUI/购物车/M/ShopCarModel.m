//
//  ShopCarModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopCarModel.h"

@implementation ShopCarModel
+(void)setWithUid:(NSString *)Uid WithBlock:(ReturnBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"uid":Uid} toHttpUrlStr:Cartshow isCacheorNot:NO targetViewController:self andUrlFunctionName:@"chakan" isValidate:NO success:^(id responseObject) {
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
        }
        
        NSLog(@"%@",responseObject);
        block(arr);

    } orFail:^(NSError *error) {
        
    }];
}


+(void)setWithGid:(NSString *)gid Withuid:(NSString *)uid WithBlock:(ReturnBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"id":gid,@"uid":uid} toHttpUrlStr:Cartdel isCacheorNot:NO targetViewController:self andUrlFunctionName:@"del" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        block(responseObject);
        NSLog(@"%@",responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
