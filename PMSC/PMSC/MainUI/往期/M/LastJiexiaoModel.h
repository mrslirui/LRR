//
//  LastJiexiaoModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK) (id value,id page) ;/*** 成功返回回调 **/
@interface LastJiexiaoModel : BaseModel

+(void)setjiexiaoWithId:(int)Id Withp:(int)p withblock:(BLOCK)block;

@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *username;
@property(nonatomic,retain)NSString *periods;
@property(nonatomic,retain)NSString *gcode;
@property(nonatomic,retain)NSString *part;
@property(nonatomic,retain)NSString *etime;
@property(nonatomic,retain)NSString *img;
@property(nonatomic,retain)NSString *ip;
@property(nonatomic,assign) int ptotal;
@end
