//
//  ChangeModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^changeBlock) (id value);

@interface ChangeModel : BaseModel
+(void)setWithBLOCK:(changeBlock)block;

@end
