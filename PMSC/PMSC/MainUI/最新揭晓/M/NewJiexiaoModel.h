//
//  NewJiexiaoModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^NewBLOCK)(id value);
@interface NewJiexiaoModel : BaseModel
+(void)setWithtype:(int)type Withpage:(int)page WithBlock:(NewBLOCK)block;
@property(nonatomic,retain)NSString *canyurenshu;
@property(nonatomic,retain)NSString *shenyurenshu;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *thumb;


@property(nonatomic,retain)NSString *shopname;
@property(nonatomic,retain)NSString *username;
@property(nonatomic,retain)NSString *q_user_code;
@property(nonatomic,retain)NSString *q_end_time;
          
@end
