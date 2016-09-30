//
//  SaimaViewModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/28.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK)(id value);
@interface SaimaViewModel : BaseModel

+ (void)setSaima:(BLOCK)block;

@end
