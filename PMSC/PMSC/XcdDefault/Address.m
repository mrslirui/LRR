//
//  Address.m
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "Address.h"

@implementation Address
+(void)pushLoginWithBlock:(LOGINBLOCK)block
{
    if (TOKEN == nil) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"登录界面" object:nil];
    }
    else
    {
        block();
    }
}
@end
