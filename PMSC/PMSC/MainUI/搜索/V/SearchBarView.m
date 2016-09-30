//
//  SearchBarView.m
//  PMSC
//
//  Created by 李锐 on 16/9/8.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SearchBarView.h"

@implementation SearchBarView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
           }
    return self;
}
//历史搜索
- (void)configTagView
{
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20*kScreenWidth, 50*kScreenHeight, 200*kScreenWidth, 30*kScreenHeight)];
    self.label.textColor = [UIColor blackColor];
    self.label.font = [UIFont systemFontOfSize:13];
    self.label.text = @"历史搜索";
    [self addSubview:self.label];
    
    [self.tagView removeAllTags];
    self.tagView = [[SKTagView alloc] init];
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    // 上下行之间的距离
    self.tagView.lineSpacing = 10;
    // item之间的距离
    self.tagView.interitemSpacing =10*kScreenWidth;
    // 最大宽度
    self.tagView.preferredMaxLayoutWidth = Screen_WIDTH;
    //    @property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
    //    @property (nonatomic,assign ) CGFloat regularHeight; //!< 固定高度
    // 原作者没有能加固定宽度的，自己修改源码加上了固定宽度和高度,默认是0，就是标签式布局，如果实现了，那么就是固定宽度高度
    //    self.tagView.regularWidth = 100;
    //    self.tagView.regularHeight = 30;
    // 开始加载
    [self.dataArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:self.dataArr[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 3.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 0;
        // 背景
        tag.bgColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        // 边框颜色
        tag.borderColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        // 字体颜色
        tag.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView addTag:tag];
    }];
      
    // 获取刚才加入所有tag之后的内在高度
    CGFloat tagHeight = self.tagView.intrinsicContentSize.height;
    NSLog(@"高度%lf",tagHeight);
    self.tagView.frame = CGRectMake(0, _label.bottom + 20*kScreenHeight, Screen_WIDTH, tagHeight);
    [self.tagView layoutSubviews];
    [self addSubview:self.tagView];
    
}
-(void)setDataArr:(NSMutableArray *)dataArr
{
    _dataArr = dataArr;
   
    [self configTagView];

}
-(void)setDataArr1:(NSMutableArray *)dataArr1
{
    _dataArr1 = dataArr1;
    [self configTagView1];
}
//热门搜索
- (void)configTagView1
{
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(20*kScreenWidth,self.tagView.bottom+ 50*kScreenHeight, 200*kScreenWidth, 30*kScreenHeight)];
    self.label1.textColor = [UIColor blackColor];
    self.label1.font = [UIFont systemFontOfSize:13];
    self.label1.text = @"热门搜索";
    [self addSubview:self.label1];
    
    [self.tagView1 removeAllTags];
    self.tagView1 = [[SKTagView alloc] init];
    // 整个tagView对应其SuperView的上左下右距离
    self.tagView1.padding = UIEdgeInsetsMake(10, 10, 10, 10);
    // 上下行之间的距离
    self.tagView1.lineSpacing = 10;
    // item之间的距离
    self.tagView1.interitemSpacing =10*kScreenWidth;
    // 最大宽度
    self.tagView1.preferredMaxLayoutWidth = Screen_WIDTH;
    //    @property (assign, nonatomic) CGFloat regularWidth; //!< 固定宽度
    //    @property (nonatomic,assign ) CGFloat regularHeight; //!< 固定高度
    // 原作者没有能加固定宽度的，自己修改源码加上了固定宽度和高度,默认是0，就是标签式布局，如果实现了，那么就是固定宽度高度
    //    self.tagView.regularWidth = 100;
    //    self.tagView.regularHeight = 30;
    // 开始加载
    [self.dataArr1 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        // 初始化标签
        SKTag *tag = [[SKTag alloc] initWithText:self.dataArr1[idx]];
        // 标签相对于自己容器的上左下右的距离
        tag.padding = UIEdgeInsetsMake(3, 15, 3, 15);
        // 弧度
        tag.cornerRadius = 3.0f;
        // 字体
        tag.font = [UIFont boldSystemFontOfSize:12];
        // 边框宽度
        tag.borderWidth = 0;
        // 背景
        tag.bgColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
        // 边框颜色
        tag.borderColor = [UIColor colorWithRed:191/255.0 green:191/255.0 blue:191/255.0 alpha:1];
        // 字体颜色
        tag.textColor = [UIColor colorWithRed:53/255.0 green:53/255.0 blue:53/255.0 alpha:1];
        // 是否可点击
        tag.enable = YES;
        // 加入到tagView
        [self.tagView1 addTag:tag];
    }];
    
    // 获取刚才加入所有tag之后的内在高度
    CGFloat tagHeight = self.tagView1.intrinsicContentSize.height;
    NSLog(@"高度%lf",tagHeight);
    self.tagView1.frame = CGRectMake(0, _label1.bottom + 20*kScreenHeight, Screen_WIDTH, tagHeight);
    [self.tagView1 layoutSubviews];
    [self addSubview:self.tagView1];
    
}

@end
