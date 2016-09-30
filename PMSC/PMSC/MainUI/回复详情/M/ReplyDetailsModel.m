//
//  ReplyDetailsModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ReplyDetailsModel.h"
#import "ReplyMessageModel.h"
@implementation ReplyDetailsModel
+ (void)setReplyDetails:(NSString *)token ID:(int)ID block:(BLOCK)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"token":token,@"id":[NSNumber numberWithInt:ID]} toHttpUrlStr:cdetail isCacheorNot:NO targetViewController:self andUrlFunctionName:@"tiezixiangqing" isValidate:NO success:^(id responseObject) {
        
        
        NSMutableArray *messageArr = [NSMutableArray array];
        for (NSDictionary *dic in responseObject[@"data"][@"data"][@"comments"]) {
            [messageArr addObject:[ReplyMessageModel  getDic:dic]];
        }
        block([self getDic:[XLMethod changeDicForkey:responseObject[@"data"][@"data"]]],messageArr);
        
    } orFail:^(NSError *error) {
        
    }];
}
@end
