//
//  QuestionDetailModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK) (id value);/*** 成功返回回调 **/

@interface QuestionDetailModel : BaseModel
+(void)setWithId:(int)Id withBlock:(BLOCK)block;
@end
