//
//  AllgoodModel.m
//  PMSC
//
//  Created by 李锐 on 16/9/18.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AllgoodModel.h"
#import "AllgoodsViewController.h"
@implementation AllgoodModel

+(void)setBlockWithReturnBlock:(ReturnValueBlock)returnBlock
{
    [xl_HttpManager httpManagerPostParameter:nil toHttpUrlStr:ShopCate isCacheorNot:NO targetViewController:self andUrlFunctionName:@"121" isValidate:NO success:^(id responseObject) {
        NSMutableArray *dataArr = [self.class modelHanderWithArray:responseObject[@"data"]];
        returnBlock( dataArr );
        
        
    } orFail:^(NSError *error) {
        
    }];
}
+(void)setBlockListWithid:(int)cID withP:(int)p ReturnBlock:(ReturnBlock)block{
    [xl_HttpManager httpManagerPostParameter:@{@"cid":[NSString stringWithFormat:@"%d",cID],@"p":[NSNumber numberWithInteger:p]} toHttpUrlStr:ShopList isCacheorNot:NO targetViewController:self andUrlFunctionName:@"liebiao" isValidate:NO success:^(id responseObject) {
        NSDictionary *dict = responseObject[@"data"];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in dict[@"data"]) {
            [arr addObject:[[self class] getDic:[XLMethod changeDicForkey:dic]]];
            
        }
        NSLog(@"%@",responseObject);
        block(arr,responseObject[@"data"][@"ptotal"]);
        
    } orFail:^(NSError *error) {
        
    }];
}

+(void)setWithSId:(int)sId Withnum:(int)num WithUId:(NSString *)uid WithBlock:(ReturnValueBlock)block
{
    [xl_HttpManager httpManagerPostParameter:@{@"id":[NSNumber numberWithInt:sId],@"num":[NSNumber numberWithInt:num],@"uid":uid} toHttpUrlStr:Cartadd isCacheorNot:NO targetViewController:self andUrlFunctionName:@"addcar" isValidate:NO success:^(id responseObject) {
        block(responseObject);
    } orFail:^(NSError *error) {
        
    }];
}


@end
