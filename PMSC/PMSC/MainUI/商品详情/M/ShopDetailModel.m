//
//  ShopDetailModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopDetailModel.h"

@implementation ShopDetailModel

+(void)setBlockShopDetailWithgid:(int)gId WithUID:(NSString *)Uid WithBLock:(RBLOCK)block
{
        [xl_HttpManager httpManagerPostParameter:@{@"gid":[NSString stringWithFormat:@"%d",gId],@"token":Uid}  toHttpUrlStr:ShopDetail isCacheorNot:NO targetViewController:self andUrlFunctionName:@"shangpinxiangqing" isValidate:NO success:^(id responseObject) {
        NSDictionary *dic = responseObject[@"data"];
        block(dic);

    } orFail:^(NSError *error) {
        
    }];
}


@end
