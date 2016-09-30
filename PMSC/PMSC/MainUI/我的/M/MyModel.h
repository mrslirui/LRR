//
//  MyModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnBlock) (id returnValue);/*** 成功返回回调 **/

@interface MyModel : BaseModel
+(void)setWithToken:(NSString *)token WithBlock:(ReturnBlock)block;
@end
