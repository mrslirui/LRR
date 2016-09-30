//
//  AllDuoBaoModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK) (id value,id page);/*** 成功返回回调 **/

@interface AllDuoBaoModel : BaseModel
+(void)setDuobaoWithid:(int)Id withP:(int)p block:(BLOCK)returnblock;
@property(nonatomic,retain)NSString * username;
@property(nonatomic,retain)NSString *uphoto;
@property(nonatomic,retain)NSString *part;
@property(nonatomic,retain)NSString *time;
@property(nonatomic,retain)NSString *ID;


@end
