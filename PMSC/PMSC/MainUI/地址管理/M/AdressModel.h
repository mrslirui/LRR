//
//  AdressModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnValueBlock) (id returnValue);/*** 成功返回回调 **/

@interface AdressModel : BaseModel
+(void)setWithId:(NSString *)Id withBLOCK:(ReturnValueBlock)block;
@property(nonatomic,retain)NSString *shouhuoren;
@property(nonatomic,retain)NSString *jiedao;
@property(nonatomic,retain)NSString *sheng;
@property(nonatomic,retain)NSString *shi;
@property(nonatomic,retain)NSString *xian;
@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSString *youbian;
@property(nonatomic,retain)NSString *mobile;
@end
