//
//  QuestionDetailModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "QuestionDetailModel.h"

@implementation QuestionDetailModel

+(void)setWithId:(int)Id withBlock:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"id":[NSNumber numberWithInt:Id]} toHttpUrlStr:IssueList isCacheorNot:NO targetViewController:self andUrlFunctionName:@"detail" isValidate:YES success:^(id responseObject) {
        NSLog(@"%@",responseObject);
        NSDictionary *dic= responseObject[@"data"];
        block(dic);
    } orFail:^(NSError *error) {
        
    }];
}
@end
