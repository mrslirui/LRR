//
//  ChangeModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ChangeModel.h"

@implementation ChangeModel

+(void)setWithBLOCK:(changeBlock)block
{
    [xl_HttpManager httpManagerPostParameter:nil toHttpUrlStr:ChangeManager isCacheorNot:NO targetViewController:self andUrlFunctionName:@"change" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        block(responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
