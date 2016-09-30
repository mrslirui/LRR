//
//  StoreBaskTableViewCell.h
//  PMSC
//
//  Created by 杨晓龙 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoreBaskTableViewCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headImgView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, assign) BOOL isImageView;// 是否有图片
@property (nonatomic, strong) NSArray *imgArray;
@property (nonatomic, strong) UILabel *dateLabel;

+(CGFloat)heightWithText:(NSString *)text;
+ (CGFloat)imgHeight:(NSArray *)imgArray;
@end
