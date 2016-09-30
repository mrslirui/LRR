//
//  AllgoodModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnValueBlock) (id returnValue);/*** 成功返回回调 **/
typedef void (^ReturnBlock) (id returnValue,id page);


typedef void (^FailureBlock)();

@interface AllgoodModel : BaseModel
/*** 左侧table数据 **/
+(void) setBlockWithReturnBlock: (ReturnValueBlock) returnBlock;

@property(nonatomic,retain)NSString *cateid;
@property(nonatomic,retain)NSString *name;

/*** 右侧数据 **/
+(void)setBlockListWithid:(int)cID withP:(int)p  ReturnBlock: (ReturnBlock) block;

@property(nonatomic ,retain)NSString *title;
@property(nonatomic,retain)NSString *periods;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *total;
@property(nonatomic,retain)NSString *part;
@property(nonatomic,retain)NSString *remain;
@property(nonatomic,retain)NSString *ID;


/* 加入购物车 **/
+(void)setWithSId:(int)sId Withnum:(int)num WithUId:(NSString *)uid WithBlock:(ReturnValueBlock)block;
@end
