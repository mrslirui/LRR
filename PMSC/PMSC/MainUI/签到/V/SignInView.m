//
//  SignInView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SignInView.h"

@interface SignInView ()
@property (nonatomic, strong) UILabel *ruleLabel;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *rlabel;
@end

@implementation SignInView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.backgroundColor = kHexColor(0xeeeeee);
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"椭圆-1-副本-3@2x"]];
    bgImageView.frame = CGRectMake(0, 0, 720 * kScreenWidth, 453 * kScreenWidth);
    bgImageView.userInteractionEnabled = YES;
    [self addSubview:bgImageView];
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(304 * kScreenWidth, 127 * kScreenWidth, 28 * 4 * kScreenWidth, 28 * kScreenWidth)];
    label1.text = @"连续签到";
    label1.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.textColor = kAppColor;
    [bgImageView addSubview:label1];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(283 * kScreenWidth, CGRectGetMaxY(label1.frame) + 14 * kScreenWidth, 155 * kScreenWidth, 1 * kScreenWidth)];
    line.backgroundColor = [UIColor lightGrayColor];
    [bgImageView addSubview:line];
    
    self.dayNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(276 * kScreenWidth, CGRectGetMaxY(line.frame) + 24 * kScreenWidth, 160* kScreenWidth, 50 * kScreenWidth)];
    self.dayNumberLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.dayNumberLabel.textAlignment = NSTextAlignmentCenter;
    self.dayNumberLabel.textColor = kAppColor;
    self.dayNumberLabel.attributedText = [XLMethod fuwenbenString:@"120天" FontNumber:[UIFont systemFontOfSize:50 * kScreenWidth] andRange:NSMakeRange(0, 3) AndColor:kAppColor andAllColor:kAppColor];
    [bgImageView addSubview:self.dayNumberLabel];
    
    self.signInButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.signInButton.frame = CGRectMake(250 * kScreenWidth, CGRectGetMaxY(self.dayNumberLabel.frame) + 117 * kScreenWidth, 222 * kScreenWidth, 63 * kScreenWidth);
    [self.signInButton setBackgroundImage:[UIImage imageNamed:@"金币-拷贝@3x_1"] forState:UIControlStateNormal];
    
    [bgImageView addSubview:self.signInButton];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(141 * kScreenWidth, 153 * kScreenWidth);
    flow.minimumInteritemSpacing = 3.75 * kScreenWidth;
    flow.minimumLineSpacing = 0;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgImageView.frame) + 20 * kScreenWidth, CGRectGetWidth(self.frame), 306 * kScreenWidth) collectionViewLayout:flow];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame) + 20 * kScreenWidth, CGRectGetWidth(self.frame), 170 * kScreenWidth)];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];
    
    self.rlabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kScreenWidth, 26 * kScreenWidth, 28 * 4 * kScreenWidth, 28 * kScreenWidth)];
    _rlabel.text = @"签到规则";
    self.rlabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    _rlabel.textColor = kHexColor(0x5b5b5b);
    [self.bgView addSubview:_rlabel];
    
    self.ruleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 * kScreenWidth, CGRectGetMaxY(_rlabel.frame) + 24 * kScreenWidth, CGRectGetWidth(self.frame) - 40 * kScreenWidth, 26 * kScreenWidth)];
    self.ruleLabel.font = [UIFont systemFontOfSize:26 * kScreenWidth];
    self.ruleLabel.textColor = kHexColor(0x9b9b9b);
    self.ruleLabel.numberOfLines = 0;
    [self.bgView addSubview:self.ruleLabel];
}
- (void)setRuleString:(NSString *)ruleString
{
    _ruleString = ruleString;
    self.ruleLabel.text = _ruleString;
    CGFloat f = [[self class] heightWithText:_ruleString];
    NSLog(@"%.2f",f);
    self.bgView.frame = CGRectMake(0, CGRectGetMaxY(self.collectionView.frame) + 20 * kScreenWidth, CGRectGetWidth(self.frame), 116 * kScreenWidth + f);
    self.ruleLabel.frame = CGRectMake(20 * kScreenWidth, CGRectGetMaxY(_rlabel.frame) + 24 * kScreenWidth, CGRectGetWidth(self.frame) - 40 * kScreenWidth, f);
    
}
+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:26 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(680 *kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
}

@end
