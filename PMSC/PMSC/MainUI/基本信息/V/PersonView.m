//
//  PersonView.m
//  PMSC
//
//  Created by 李锐 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PersonView.h"

@implementation PersonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatView];
        self.backgroundColor = RGBA(239, 239, 239, 1);
    }
    return self;
}
-(void)creatView
{
    UIView *asd = [[UIView alloc] initWithFrame:CGRectMake(0, 21*kScreenHeight, Screen_WIDTH, 82*3*kScreenHeight)];
    [self addSubview:asd];
    asd.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( 10*kScreenWidth, 0, 120*kScreenWidth, 82*kScreenHeight)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake( 10*kScreenWidth, 82*1*kScreenHeight, 120*kScreenWidth, 82*kScreenHeight)];
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake( 10*kScreenWidth, 82*2*kScreenHeight, 120*kScreenWidth, 82*kScreenHeight)];
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:28 *kScreenWidth];
    [asd addSubview:label];
    [asd addSubview:label1];
    [asd addSubview:label2];
    self.head = [[UIImageView alloc] initWithFrame:CGRectMake(self.right -100*kScreenWidth, 6*kScreenHeight, 70*kScreenHeight, 70*kScreenHeight)];
    [asd addSubview:_head];
    _head.layer.cornerRadius = 35*kScreenHeight;
    _head.backgroundColor = [UIColor redColor];
   
    self.name = [[UILabel alloc] initWithFrame:CGRectMake(self.right -100*kScreenWidth, 82*kScreenHeight, 200*kScreenWidth, 82*kScreenHeight)];
    _name.text = @"大风";
    [asd addSubview:self.name];
    self.sex = [[UILabel alloc] initWithFrame:CGRectMake(_name.left, 82*2*kScreenHeight, 200*kScreenWidth, _name.height)];
    
    _sex.text = @"女";
//    _sex.textAlignment = NSTextAlignmentRight;
    [asd addSubview:self.sex];
   
    
    UIView *xian=[[UIView alloc] initWithFrame:CGRectMake(0,label.bottom, Screen_WIDTH, 0.5)];
    xian.backgroundColor = [UIColor blackColor];
    xian.alpha = 0.3;
    [asd addSubview:xian];
    UIView *xian1=[[UIView alloc] initWithFrame:CGRectMake(0,label1.bottom, Screen_WIDTH, 0.5)];
    xian1.backgroundColor = [UIColor blackColor];
    xian1.alpha = 0.3;
    [asd addSubview:xian1];
    _name.font = [UIFont systemFontOfSize:26  *kScreenWidth];
    _sex.font = [UIFont systemFontOfSize:26  *kScreenWidth];
    _name.textColor = RGBA(112, 112, 112, 1);
    _sex.textColor = RGBA(112, 112, 112, 1);

    label.text =@"头像";
    label1.text = @"昵称";
    label2.text = @"性别";
    
//    NSString *str = value[@"username"];
//    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:30*kScreenWidth]};
//    self.pView.name.numberOfLines = 0;
//    CGSize textSize = [str boundingRectWithSize:CGSizeMake(200, 82*kScreenHeight) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;;
//    
//    [self.pView.name setFrame:CGRectMake(self.view.right - 100*kScreenWidth, 82*kScreenHeight, textSize.width, textSize.height)];
//    
//    self.pView.name.text = str;
//
    
}
-(void)setNameStr:(NSString *)nameStr
{
    _nameStr = nameStr;
   
    _name.numberOfLines = 0;
    NSDictionary *attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:26*kScreenWidth]};
    //    self.pView.name.numberOfLines = 0;
        CGSize textSize = [_nameStr boundingRectWithSize:CGSizeMake(400*kScreenWidth, 82*kScreenHeight) options:NSStringDrawingTruncatesLastVisibleLine attributes:attributes context:nil].size;;
    
        [self.name setFrame:CGRectMake(self.right - textSize.width -10*kScreenWidth, 82*kScreenHeight+21*kScreenHeight, textSize.width, textSize.height)];
    self.name.text = _nameStr;
    
}
@end
