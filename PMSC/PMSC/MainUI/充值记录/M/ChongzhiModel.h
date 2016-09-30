//
//  ChongzhiModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/29.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^PaylogBlock) (id value);
@interface ChongzhiModel : BaseModel
+(void)setWithUid:(NSString *)uid WithBLock:(PaylogBlock)block;

@property(nonatomic,retain)NSString  *moneytoal;
@property(nonatomic,retain)NSString  *time;
@property(nonatomic,retain)NSString  *pay_type;
@property(nonatomic,retain)NSString  *money;
@end
