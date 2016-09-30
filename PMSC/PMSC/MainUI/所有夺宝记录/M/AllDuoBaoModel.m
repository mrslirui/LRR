//
//  AllDuoBaoModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AllDuoBaoModel.h"

@implementation AllDuoBaoModel


+(void)setDuobaoWithid:(int)Id withP:(int)p block:(BLOCK)returnblock
{
    [xl_HttpManager httpManagerPostParameter:@{@"gid":[NSString stringWithFormat:@"%d",Id],@"p":[NSNumber numberWithInteger:p]} toHttpUrlStr:ALLindiana isCacheorNot:NO targetViewController:self andUrlFunctionName:@"jiexiao" isValidate:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"][@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
            
        }
        
        returnblock(arr,responseObject[@"data"][@"ptotal"]);
        
    } orFail:^(NSError *error) {
        
    }];
    
}
//-(void)setValue:(id)value forUndefinedKey:(NSString *)key
//{
//    if ([key isEqualToString:@"id"]) {
//        self.Id = value;
//    }
//}

@end
