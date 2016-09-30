//
//  NewJiexiaoModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewJiexiaoModel.h"

@implementation NewJiexiaoModel
+(void)setWithtype:(int)type Withpage:(int)page WithBlock:(NewBLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"type":[NSNumber numberWithInt:type],@"pagenum":[NSNumber numberWithInt:page]} toHttpUrlStr:Kaijiang isCacheorNot:NO targetViewController:self andUrlFunctionName:@"kj" isValidate:NO success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        block(responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
