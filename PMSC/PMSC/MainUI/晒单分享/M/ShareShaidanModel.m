//
//  ShareShaidanModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShareShaidanModel.h"

@implementation ShareShaidanModel
+(void)setShareShaidanWithLimit:(int)limit BLOCK:(ReturnValueBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"p":[NSNumber numberWithInt:limit]} toHttpUrlStr:@"http://gangmaduobao.com/?/api/shop/json_shopshare" isCacheorNot:NO targetViewController:self andUrlFunctionName:@"share" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"][@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
            block(arr,responseObject[@"data"][@"ptotal"]);
        }
    } orFail:^(NSError *error) {
        
    }];
    
}

@end
