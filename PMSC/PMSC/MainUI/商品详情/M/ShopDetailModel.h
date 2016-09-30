//
//  ShopDetailModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"

typedef void (^RBLOCK) (id returnValue);/*** 成功返回回调 **/
@interface ShopDetailModel : BaseModel
//@property (strong, nonatomic) ReturnBlock returnBlock;

+(void)setBlockShopDetailWithgid:(int) gId WithUID:(NSString *)Uid WithBLock:(RBLOCK)block;


/*** 查看购物车 **/
//+(void)setWithUid:(NSString *)Uid WithBlock:(ReturnBlock)block;
@end
