//
//  TitleAndImageView.m
//  FriendRound
//
//  Created by 杨晓龙 on 16/8/20.
//  Copyright © 2016年 杨晓龙. All rights reserved.
//

#import "TitleAndImageView.h"
#import "UIView+SDAutoLayout.h"
@implementation TitleAndImageView
//- (instancetype)init
//{
//    self = [super init];
//    if (self) {
//        [self load];
//    }
//    return self;
//}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
    }
    return self;
}

- (void)load
{
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.height)];
        [self addSubview:self.imageView];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame) + 3, 0, CGRectGetWidth(self.frame) - CGRectGetMaxX(self.imageView.frame), CGRectGetHeight(self.frame))];
        self.label.font = [UIFont systemFontOfSize:24 * kScreenWidth];
        [self addSubview:self.label];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
