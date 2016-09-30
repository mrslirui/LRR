//
//  ReplyDetailsModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK)(id value,id message);

@interface ReplyDetailsModel : BaseModel

@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) int time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) int total;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSArray *comments;
@property (nonatomic, assign) int reward;

+ (void)setReplyDetails:(NSString *)token ID:(int)ID block:(BLOCK)block;
@end
