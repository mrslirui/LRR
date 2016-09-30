//
//  XLSegmentView.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "XLSegmentView.h"
#import "XLBgView.h"
#define kScreenW   [UIScreen mainScreen].bounds.size.width

#define kScreenH   [UIScreen mainScreen].bounds.size.height
#define kScreenWidth [UIScreen mainScreen].bounds.size.width / 720.
#define kScreenHeight [UIScreen mainScreen].bounds.size.height / 1280.

@interface XLSegmentView ()
@property (nonatomic, strong) NSMutableArray *selectArray;
@property (nonatomic, strong) NSMutableArray *buttonArray;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation XLSegmentView
{
    float width;//每个按钮的宽度
    
    UIImageView *_selectImage;
}
- (NSMutableArray *)selectArray
{
    if (!_selectArray) {
        self.selectArray = [NSMutableArray array];
    }
    return _selectArray;
}
- (NSMutableArray *)buttonArray
{
    if (!_buttonArray) {
        self.buttonArray = [NSMutableArray array];
    }
    return _buttonArray;
}
-(id)initWithFrame:(CGRect)frame withTitleArr:(NSArray*)TitleArr
{
    if (self = [super initWithFrame:frame]) {
        
        [self creatSegmentView:TitleArr];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiAciton:) name:@"jiandu" object:nil];
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
//创建底部滑块
- (void)setSelectImageName:(NSString *)selectImageName {
    
    _selectImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height -3, width, 3)];
    
    _selectImage.image = [UIImage imageNamed:selectImageName];
    
    [self addSubview:_selectImage];
    
}


//循环创建button用于覆盖在view上用作itemsegment
-(void)creatSegmentView:(NSArray*)arr
{
    //    if (arr.count <= 4) {
    width = 166 * kScreenWidth;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    _scrollView.contentSize = CGSizeMake(width * arr.count , self.frame.size.height);
    _scrollView.bounces = NO;
    [self addSubview:_scrollView];
    
    //        width = self.frame.size.width/arr.count;
    
    for (int i = 0; i < arr.count; i++) {
        
        if (i == 0) {
            [self.selectArray addObject:@"1"];
        }else
        {
            [self.selectArray addObject:@"0"];
        }
        
        XLBgView *viewEnble = [[XLBgView alloc] initWithFrame:CGRectMake(i*width, 0 * kScreenWidth, width,self.frame.size.height)];
        
        
       
        viewEnble.titleLabel1.textColor = [UIColor lightGrayColor];
        viewEnble.imgView.image = [UIImage imageNamed:@"王冠 (2)"];
        
        
        [_scrollView addSubview:viewEnble];
        viewEnble.titleLabel1.text = arr[i];
        
        viewEnble.tag = 10000 + i;
        
        //            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        //
        //            button.frame = CGRectMake(i*width, 0, width,self.frame.size.height);
        //
        //            [button setTitle:arr[i] forState:UIControlStateNormal];
        //
        //            [button setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
        //
        //            //        选中的按钮调用方法
        [viewEnble addTarget:self action:@selector(segButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        //
        //            [button setTag:10000 +i];
        //
        //
        //            //    设置初始button 的颜色与字体大小
        if (i == 0) {
            viewEnble.titleLabel1.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
            viewEnble.imgView.image = [UIImage imageNamed:@"王冠 (1)"];
            
        }else
        {
            viewEnble.selected = NO;
        }
        [self.buttonArray addObject:viewEnble];
        //            [self addSubview:button];
    }
    //    }else
    //    {
    //        width = self.frame.size.width/4;
    //    }
    
    
    
    
}

- (void)segButtonAction:(XLBgView *)sender {
    //    XLBgView *sender = (XLBgView *)tap.view;
    NSInteger index = sender.tag - 10000;
  
    float xx = (kScreenW * (index) * (166 * kScreenWidth / kScreenW)) - 166 * kScreenWidth;
    [_scrollView scrollRectToVisible:CGRectMake(xx, 0, kScreenW, self.scrollView.frame.size.height) animated:YES];
    
    
    
    
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[XLBgView class]]) {
            XLBgView *btn = (XLBgView*)view;
            btn.selected = NO;
            sender.titleLabel1.textColor = [UIColor lightGrayColor];
            sender.imgView.image = [UIImage imageNamed:@"王冠 (2)"];
        }
    }
    //    被选中的button
    sender.selected = YES;
    
    
    sender.titleLabel1.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
    sender.imgView.image = [UIImage imageNamed:@"王冠 (1)"];
    
    
    if ([self.selectArray[index] isEqualToString:@"0"]) {
        [self.selectArray replaceObjectAtIndex:index withObject:@"1"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"jiandu" object:nil userInfo:@{@"a":[NSString stringWithFormat:@"%ld",index]}];
    }
    
    
    
    
    //    调用block方法，进行传值给viewController，用与进行判断
    _segmentBlock(sender.tag -10000 , sender);
    
    
    
}
- (void)notiAciton:(NSNotification *)noti
{
    NSInteger index = [noti.userInfo[@"a"] integerValue];
    for (int i = 0; i < _buttonArray.count; i++) {
        XLBgView *sender = (XLBgView *)_buttonArray[i];
        if (i == index) {
            sender.titleLabel1.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
            sender.imgView.image = [UIImage imageNamed:@"王冠 (1)"];
        }else
        {
            sender.titleLabel1.textColor = [UIColor lightGrayColor];
            sender.imgView.image = [UIImage imageNamed:@"王冠 (2)"];
            [self.selectArray replaceObjectAtIndex:i withObject:@"0"];
        }
    }
}
@end
