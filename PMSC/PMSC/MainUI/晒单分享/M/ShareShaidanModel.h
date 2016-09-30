//
//  ShareShaidanModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnValueBlock) (id returnValue,id p);/*** 成功返回回调 **/
@interface ShareShaidanModel : BaseModel
+(void)setShareShaidanWithLimit:(int)limit BLOCK:(ReturnValueBlock)block;
@property(nonatomic,retain)NSString *username;
@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *periods;
@property(nonatomic,retain)NSString *img;
@property(nonatomic,retain)NSString *shopid;
@property(nonatomic,retain)NSString *time;
@property(nonatomic,retain)NSString *content;
@property(nonatomic,retain)NSArray *photplist;
@property(nonatomic,retain)NSString *comments;
@end
