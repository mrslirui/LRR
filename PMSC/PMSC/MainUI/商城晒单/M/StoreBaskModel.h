//
//  StoreBaskModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK)(id value);
@interface StoreBaskModel : BaseModel

@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) int shopid;
@property (nonatomic, assign) int periods;
@property (nonatomic, assign) float time;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSArray *photolist;
@property (nonatomic, assign) int comments;
@property (nonatomic, assign) int cnum;
@property (nonatomic, assign) int ptotal;
@property (nonatomic, assign) int usernum;

+ (void)setStoreBaskP:(int)p id:(NSString *)ID block:(BLOCK)block;
@end
