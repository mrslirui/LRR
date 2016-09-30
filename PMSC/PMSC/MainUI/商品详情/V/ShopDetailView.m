//
//  ShopDetailView.m
//  PMSC
//
//  Created by 李锐 on 16/8/31.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopDetailView.h"

@interface ShopDetailView ()
@property(nonatomic,retain)NSArray *arr;
@end
@implementation ShopDetailView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
         self.arr = @[@"图标 (1)",@"图标 (2)",@"图标 (3)",@"图标 (4)",@"图标 (5)",@"图标 (6)",@"图标 (7)"];
        [self creatLunbo];
    }
    return self;
}

-(void)creatView
{
    //  CGFloat h = [self heightWithText:_titleLb.text];
    
    self.tiplabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 501*kScreenHeight, Screen_WIDTH, 75*kScreenHeight)];
    [self addSubview:_tiplabel];
    _tiplabel.text = _detailDic[@"ustate"];
    _tiplabel.backgroundColor = kHexColor(0Xeeeeee);
    
    UIView *bgView1 = [[UIView alloc] initWithFrame:CGRectMake(0, _tiplabel.top - 161*kScreenHeight, Screen_WIDTH, 161*kScreenHeight)];
    [self addSubview:bgView1];
    UILabel *duobao = [[UILabel alloc] initWithFrame:CGRectMake(19*kScreenWidth, bgView1.top + 10*kScreenHeight, 90 *kScreenWidth, 39*kScreenHeight)];
    [self addSubview:duobao];
    duobao.text  = _detailDic[@"state"];
    duobao.backgroundColor = kHexColor(0x954cfb);
    duobao.font = [UIFont systemFontOfSize:26*kScreenWidth];
    duobao.textColor = [UIColor whiteColor];
    duobao.textAlignment = NSTextAlignmentCenter;
    self.titleLb = [[UILabel alloc] initWithFrame:CGRectMake(duobao.right  +20*kScreenWidth, bgView1.top, Screen_WIDTH- 130*kScreenWidth,90*kScreenHeight)];
    [self addSubview:_titleLb];
    
    self.progressView = [[LRProgress alloc ] initWithFrame:CGRectMake(19*kScreenWidth, _titleLb.bottom +10*kScreenHeight, Screen_WIDTH - 38*kScreenWidth, 10*kScreenHeight)];
    [self addSubview:_progressView];
    _progressView.leftColor = [UIColor yellowColor];
    _progressView.rightColor = [UIColor lightGrayColor];
    
    self.total = [[UILabel alloc] initWithFrame:CGRectMake(19*kScreenWidth, _progressView.bottom + 20*kScreenHeight, 250*kScreenWidth, 20*kScreenHeight)];
    [self addSubview:_total];
    _total.text = @"总需: 600人次";
    
    self.retainLb = [[UILabel alloc] initWithFrame:CGRectMake(self.right - 220 *kScreenWidth, _total.top, 200*kScreenWidth, _total.height)];
    [self addSubview:_retainLb];
    _retainLb.text = @"剩余: 7";
    
    _tiplabel.textAlignment = NSTextAlignmentCenter;
    _tiplabel.textColor = kHexColor(0x686868);
    _total.font = [UIFont systemFontOfSize:26*kScreenWidth];
    _retainLb.font = [UIFont systemFontOfSize:26*kScreenWidth];
    _tiplabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
    _titleLb.font = [UIFont systemFontOfSize:28*kScreenWidth];
    self.titleLb.text = [NSString stringWithFormat:@"(第%@期)%@",_detailDic[@"periods"] ,_detailDic[@"title"]];
    self.total.text =[NSString stringWithFormat:@"总需: %@人次",_detailDic[@"total"]];
    self.retainLb.text = [NSString stringWithFormat:@"剩余: %@人次",_detailDic[@"remain"]];
    
    CGFloat f = [_detailDic[@"part"] floatValue] /[_detailDic[@"total"] floatValue];
    NSLog(@"%.2f",f);
    self.progressView.progress = f;
    
    _titleLb.sd_layout
    .topEqualToView(bgView1)
    .leftSpaceToView(duobao,20*kScreenWidth)
    .widthIs(Screen_WIDTH - 130*kScreenWidth)
    .autoHeightRatio(0);
}

-(void)creatLunbo
{
    self.xlCycleScrollView = [XLCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.frame.size.width, 336 *kScreenHeight) delegate:self placeholderImage:[UIImage imageNamed:@"zwt3"]];
    self.xlCycleScrollView.pageControlAliment = XLCyclesScrollViewPageContolAlimentCenter;
    self.xlCycleScrollView.currentPageDotColor = [UIColor redColor];
    self.xlCycleScrollView.pageDotColor = kHexColor(0xeeeeee);
    self.xlCycleScrollView.backgroundColor = [UIColor greenColor];
    self.xlCycleScrollView.imageURLStringsGroup = _arr;
    [self addSubview:self.xlCycleScrollView];
    
    
}
- (void)cycleScrollView:(XLCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
//    self.click(index);
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.click(indexPath.item);
}

#pragma mark -set方法
-(void)setDetailDic:(NSDictionary *)detailDic
{
    _detailDic = detailDic;
    NSLog(@"%@",_detailDic);
    _arr = _detailDic[@"picarr"];
     [self creatView];
}

-(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:30 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(Screen_WIDTH- 190*kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
}

@end
