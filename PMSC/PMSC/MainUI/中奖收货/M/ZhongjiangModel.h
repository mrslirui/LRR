//
//  ZhongjiangModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^ZhongjiangBLock) (id value);
@interface ZhongjiangModel : BaseModel
+(void)setWithType:(int)type Withname:(NSString *)uname withBlock:(ZhongjiangBLock)block;

@property(nonatomic,retain)NSString *q_end_time;
@property(nonatomic,retain)NSString *shopname;
@property(nonatomic,retain)NSString *shopqishu;
@property(nonatomic,retain)NSString *thumb;
@end
