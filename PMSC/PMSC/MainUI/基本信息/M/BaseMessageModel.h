//
//  BaseMessageModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK)(id value);

@interface BaseMessageModel : BaseModel
+(void)setWithtoken:(NSString *)token WithBlock:(BLOCK)block;
@end
