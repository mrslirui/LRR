//
//  PostedViewModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"

typedef void (^BLOCK)(id Value);

@interface PostedViewModel : BaseModel
+ (void)postWithToken:(NSString *)token title:(NSString *)title content:(NSString *)content img:(NSString *)img block:(BLOCK)block;
@end
