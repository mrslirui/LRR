//
//  FindViewModel.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
typedef void (^BLOCK)();
@interface FindViewModel : BaseModel
@property (nonatomic, assign) int ID;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, assign) int total;
@property (nonatomic, assign) int time;
@property (nonatomic, strong) NSString *img;
@property (nonatomic, assign) int reward;
@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *identity;
@property (nonatomic, assign) int ptotal;

+ (void)setFindViewP:(int)p block:(BLOCK)block;
+ (void)setReward:(int)ID block:(BLOCK)block;
@end
