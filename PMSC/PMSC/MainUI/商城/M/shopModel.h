//
//  shopModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"

typedef void (^ReturnBlock) (id returnValue);/*** 成功返回回调 **/

@interface shopModel : BaseModel
+(void)setBLockwithblock:(ReturnBlock)reblock;

@property(nonatomic,retain)NSString  *shopname;
@property(nonatomic,retain)NSString  *username;
@property(nonatomic,retain)NSString  *canyurenshu;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *shenyurenshu;
@property(nonatomic,retain)NSString *title;
@property(nonatomic,retain)NSString *thumb;
@property(nonatomic,retain)NSString *qishu;
@property(nonatomic,retain)NSString *ID;
@end
