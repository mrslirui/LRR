//
//  shopModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "shopModel.h"

@implementation shopModel
+(void)setBLockwithblock:(ReturnBlock)reblock
{
    
    [xl_HttpManager httpManagerPostParameter:nil toHttpUrlStr:ShopFist isCacheorNot:NO targetViewController:self andUrlFunctionName:@"shangcheng" isValidate:NO success:^(id responseObject) {
         reblock(responseObject[@"data"]);
       
        
        NSLog(@"%@",responseObject);
    } orFail:^(NSError *error) {
        
    }];
}

@end
