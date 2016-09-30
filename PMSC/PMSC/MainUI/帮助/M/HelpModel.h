//
//  HelpModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK) (id value);/*** 成功返回回调 **/

@interface HelpModel : BaseModel
@property(nonatomic,retain)NSString *issue;
@property(nonatomic,retain)NSString *ID;
+(void)setWithType:(int)type withuserId:(NSString *)Uid withBlock:(BLOCK)block;
@end
