//
//  SaimaViewModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SaimaViewModel.h"

@implementation SaimaViewModel

+ (void)setSaima:(BLOCK)block
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [xl_HttpManager httpManagerPostParameter:nil toHttpUrlStr:homepage isCacheorNot:NO targetViewController:self andUrlFunctionName:@"saima" isValidate:NO success:^(id responseObject) {
            NSLog(@"%@",responseObject);
        } orFail:^(NSError *error) {
            
        }];
    });
    
}
@end
