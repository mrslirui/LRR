//
//  AddAdressModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnValueBlock) (id returnValue);/*** 成功返回回调 **/

@interface AddAdressModel : BaseModel
+(void)setWithDic:(NSDictionary *)dic WithBLOCK:(ReturnValueBlock)block;
@end
