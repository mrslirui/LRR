//
//  XLSegmentView.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLBgView.h"
typedef void(^segmentBlock)(NSInteger segmentNum , XLBgView *btn);
@interface XLSegmentView : UIView

@property(nonatomic,copy)NSArray *itemArr;

@property(nonatomic,copy)segmentBlock segmentBlock;

-(id)initWithFrame:(CGRect)frame withTitleArr:(NSArray*)TitleArr;

- (void)setSelectImageName:(NSString *)selectImageName;

@end