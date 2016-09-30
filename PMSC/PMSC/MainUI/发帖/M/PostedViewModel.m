//
//  PostedViewModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PostedViewModel.h"

@implementation PostedViewModel
+ (void)postWithToken:(NSString *)token title:(NSString *)title content:(NSString *)content img:(NSString *)img block:(BLOCK)block
{
    NSDictionary *dic;
    if (img.length == 0) {
        dic = @{@"token":token,@"title":title,@"content":content};
    }else
    {
        dic = @{@"token":token,@"title":title,@"content":content,@"img":img};
    }
    [xl_HttpManager httpManagerPostParameter:dic toHttpUrlStr:CPUBLIC isCacheorNot:NO targetViewController:self andUrlFunctionName:@"fatie" isValidate:YES success:^(id responseObject) {
        block(responseObject);
    } orFail:^(NSError *error) {
        
    }];
}
@end
