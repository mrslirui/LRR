//
//  ReplyDetailTableViewCell.h
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XLFUWENBENTextView.h"
#import "ReplyMessageModel.h"
@interface ReplyDetailTableViewCell : UITableViewCell
@property (nonatomic, strong) XLFUWENBENTextView *nickNameLabel;
@property (nonatomic, strong) ReplyMessageModel *model;
+(CGFloat)heightWithText:(NSAttributedString *)text;
@end
