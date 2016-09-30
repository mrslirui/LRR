//
//  ReplyMessageModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"

@interface ReplyMessageModel : BaseModel
@property (nonatomic, strong) NSString *pname;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *con;
@property (nonatomic, assign) int time;
@end
