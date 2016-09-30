//
//  ShopCarModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void(^ReturnBlock) (id value);
@interface ShopCarModel : BaseModel
/*** 查看购物车 **/
+(void)setWithUid:(NSString *)Uid WithBlock:(ReturnBlock)block;

@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *yunjiage;
@property(nonatomic,retain)NSString *canyurenshu;
@property(nonatomic,retain)NSString *shenyurenshu;
@property(nonatomic,retain)NSString *thumb;

/*** 删除购物车 **/
+(void)setWithGid:(NSString *)gid Withuid:(NSString *)uid WithBlock:(ReturnBlock)block;
@end
