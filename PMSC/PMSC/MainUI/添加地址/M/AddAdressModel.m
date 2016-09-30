//
//  AddAdressModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddAdressModel.h"

@implementation AddAdressModel
+(void)setWithDic:(NSDictionary *)dic WithBLOCK:(ReturnValueBlock)block
{
    [xl_HttpManager httpManagerPostParameter:dic toHttpUrlStr:@"http://gangmaduobao.com/?/api/dizhitj/tj" isCacheorNot:NO targetViewController:self andUrlFunctionName:@"tianjia" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        block(responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
