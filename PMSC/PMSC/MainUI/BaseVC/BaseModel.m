//
//  BaseModel.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "BaseModel.h"
#import "XLExtension.h"
@implementation BaseModel
+ (id)getDic:(NSDictionary *)dic
{
    NSDictionary *dict = [XLExtension getModelWithDictionary:dic class:[self class]];
    id model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

//-(instancetype)initWithDic:(NSDictionary *)dic
//{
//    self = [super init];
//    
//    if (self) {
//        [ self setValuesForKeysWithDictionary:dic];
//        
//    }return self;
//}
//+(instancetype)modelWithDic:(NSDictionary *)dic
//{   //self class 表示当前类
//    id m = [[[self class] alloc] initWithDic:dic];
//    return m;
//}
+(NSMutableArray *)modelHanderWithArray:(NSArray *)Arr
{
    //1.创建空数组 保存处理后的model对象
    NSMutableArray *mArr = [ NSMutableArray array];
    //2.遍历传入的数组参数 得到每个字典的信息
    for (NSDictionary *dic in Arr) {
        //3.使用KVC转换为对象
        id m = [[self class] getDic:dic];
        //4.添加到数组
        [mArr addObject:m];
        
        
    } return mArr;
}

@end
