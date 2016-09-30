//
//  SearchModel.h
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^ReturnValueBlock) (id returnValue,id page);/*** 成功返回回调 **/

@interface SearchModel : BaseModel
+(void)setSearchWithKey:(NSString *)key WithP:(int)p WithBLOCK:(ReturnValueBlock)block;
@property(nonatomic,retain)NSString *ID;
@property(nonatomic,retain)NSString *money;
@property(nonatomic,retain)NSString *total;
@property(nonatomic,retain)NSString *remain;
@property(nonatomic,retain)NSString *periods;
@property(nonatomic,retain)NSString *part;
@property(nonatomic,retain)NSString *title;
@end
