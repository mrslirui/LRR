//
//  AboutModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"

typedef void (^ReturnBlock) (id returnValue);/*** 成功返回回调 **/

@interface AboutModel : BaseModel


+(void)setBlockWithBlock:(ReturnBlock)block;
@end
