//
//  AboutModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AboutModel.h"

@implementation AboutModel

+(void)setBlockWithBlock:(ReturnBlock)block
{
    [xl_HttpManager httpManagerPostParameter:nil toHttpUrlStr:AboutUs isCacheorNot:NO targetViewController:self andUrlFunctionName:@"about" isValidate:NO success:^(id responseObject) {
        
        block(responseObject[@"data"]);
    } orFail:^(NSError *error) {
        
    }];
}
@end
