//
//  DuobaoModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^BLOCK) (id value);
@interface DuobaoModel : BaseModel

+(void)setWithType:(int)type WithToken:(NSString *)token WithBlock:(BLOCK)block;

@property(nonatomic,retain)NSString *canyurenshu;
@property(nonatomic,retain)NSString *thumb;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *zongrenshu;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *q_end_time;
@property(nonatomic,retain)NSString *mobile;
@end
