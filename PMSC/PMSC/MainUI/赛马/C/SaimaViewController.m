//
//  SaimaViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//
#import "SaimaViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "CoreAnimationEffect.h"
#import "UIView+SDAutoLayout.h"
#import "XLFormView.h"
#import "XLSegmentView.h"
#import "XLFormView.h"
#import "ProfitAndLossViewDetailViewController.h"
#import "XLFormViewQuickBuilder.h"
#import "ProfitAndLossViewController.h"
#import "StageBGView.h"
#import "SaimaViewModel.h"
// 两场时间间隔
#define time 10
@interface SaimaViewController ()<XLFormViewDataSource,XLFormViewDelegate>
{
    BOOL isBGHidden;//是否转领奖台
    BOOL flag;
    float b;
    int idnex;
    int secondsCountDown;
    NSTimer *countDownTimer;
    NSTimer *rankTimer;
    NSString *ace;
    NSTimer *timer;
    NSTimer *bgtimer;
    NSTimer *stopbgTimer;
    NSTimer *stopRankTimer;
    NSTimer *stopBTimer;
}
@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) StageBGView *stageBGView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *imgView1;
@property (nonatomic, strong) UIImageView *imgView2;
@property (nonatomic, strong) UIImageView *imgView3;
@property (nonatomic, strong) UIImageView *imgView4;
@property (nonatomic, strong) UIImageView *imgView5;
@property (nonatomic, strong) UIImageView *imgView6;
@property (nonatomic, strong) UIImageView *imgView7;
@property (nonatomic, strong) UIImageView *imgView8;
@property (nonatomic, strong) UIImageView *imgView9;
@property (nonatomic, strong) UIImageView *imgView10;
@property (nonatomic, strong) UILabel *dateLabel;
@property (nonatomic, strong) UILabel *csumLabel1;
@property (nonatomic, strong) UILabel *csumLabel2;
@property (nonatomic, strong) UILabel *csumLabel3;
@property (nonatomic, strong) UILabel *numberLabel1;
@property (nonatomic, strong) UILabel *numberLabel2;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *mTimeLabel;
@property (nonatomic, strong) UIImageView *timeBGImageView;
@property (nonatomic, strong) UILabel *mTimeLabel1;
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UILabel *mResultLabel;
@property (nonatomic, strong) UIImageView *rank1;
@property (nonatomic, strong) UIImageView *rank2;
@property (nonatomic, strong) UIImageView *rank3;
@property (nonatomic, strong) UIImageView *rank4;
@property (nonatomic, strong) UIImageView *rank5;
@property (nonatomic, strong) UIImageView *rank6;
@property (nonatomic, strong) UIImageView *rank7;
@property (nonatomic, strong) UIImageView *rank8;
@property (nonatomic, strong) UIImageView *rank9;
@property (nonatomic, strong) UIImageView *rank10;
@property (nonatomic, strong) NSMutableArray *arr1;
@property (nonatomic, strong) NSMutableArray *arr2;
@property (nonatomic, strong) NSMutableArray *arr3;
@property (nonatomic, strong) NSMutableArray *arr4;
@property (nonatomic, strong) NSMutableArray *arr5;
@property (nonatomic, strong) NSMutableArray *arr6;
@property (nonatomic, strong) NSMutableArray *arr7;
@property (nonatomic, strong) NSMutableArray *arr8;
@property (nonatomic, strong) NSMutableArray *arr9;
@property (nonatomic, strong) NSMutableArray *arr10;
@property (nonatomic, strong) XLSegmentView *sengMent;
@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *titles1;
@property (nonatomic, strong) XLFormView *xlfor1;
@property (nonatomic, strong) XLFormView *xlfor2;
@property (nonatomic, strong) XLFormView *xlfor3;
@property (nonatomic, strong) XLFormView *xlfor4;
@property (nonatomic, strong) XLFormView *xlfor5;
@property (nonatomic, strong) XLFormView *xlfor6;
@property (nonatomic, strong) XLFormView *xlfor7;
@property (nonatomic, strong) XLFormView *xlfor8;
@property (nonatomic, strong) XLFormView *xlfor9;
@property (nonatomic, strong) XLFormView *xlfor10;
@property (nonatomic, strong) UIButton *xiazhuButton;
@end

@implementation SaimaViewController
- (NSMutableArray *)arr1
{
    if (!_arr1) {
        self.arr1 = [NSMutableArray array];
    }
    return _arr1;
}
- (NSMutableArray *)arr2
{
    if (!_arr2) {
        self.arr2 = [NSMutableArray array];
    }
    return _arr2;
}
- (NSMutableArray *)arr3
{
    if (!_arr3) {
        self.arr3 = [NSMutableArray array];
    }
    return _arr3;
}
- (NSMutableArray *)arr4
{
    if (!_arr4) {
        self.arr4 = [NSMutableArray array];
    }
    return _arr4;
}
- (NSMutableArray *)arr5
{
    if (!_arr5) {
        self.arr5 = [NSMutableArray array];
    }
    return _arr5;
}
- (NSMutableArray *)arr6
{
    if (!_arr6) {
        self.arr6 = [NSMutableArray array];
    }
    return _arr6;
}
- (NSMutableArray *)arr7
{
    if (!_arr7) {
        self.arr7 = [NSMutableArray array];
    }
    return _arr7;
}
- (NSMutableArray *)arr8
{
    if (!_arr8) {
        self.arr8 = [NSMutableArray array];
    }
    return _arr8;
}
- (NSMutableArray *)arr9
{
    if (!_arr9) {
        self.arr9 = [NSMutableArray array];
    }
    return _arr9;
}
- (NSMutableArray *)arr10
{
    if (!_arr10) {
        self.arr10 = [NSMutableArray array];
    }
    return _arr10;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"赛马";
    self.view.backgroundColor = [UIColor colorWithRed:0.9333 green:0.9333 blue:0.9333 alpha:1.0];
    flag = YES;
    b = 110;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame) - 51)];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1100 * kScreenWidth + (21 * 60 * kScreenWidth));
    [self.view addSubview:self.scrollView];
    [self creatImageVIew];
    [self createExcel];
    countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
    self.mTimeLabel.text = [self gettime:secondsCountDown];
//    [SaimaViewModel setSaima:^(id value) {
//        
//    }];
}

- (void)rankAction:(NSTimer *)ti
{
    self.index++;
    if (self.index > 40) {
        self.index = 0;
        [rankTimer invalidate];
        [self rankMove:@{@"short":@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]}];
    }else
    {
        CGFloat a1 = [self.arr1[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a2 = [self.arr2[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a3 = [self.arr3[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a4 = [self.arr4[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a5 = [self.arr5[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a6 = [self.arr6[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a7 = [self.arr7[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a8 = [self.arr8[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a9 = [self.arr9[self.index - 1] floatValue] - 100 * kScreenWidth;
        CGFloat a10 = [self.arr10[self.index - 1] floatValue] - 100 * kScreenWidth;
        
        NSMutableArray *ar = [NSMutableArray array];
        [ar addObject:self.arr1[self.index - 1]];
        [ar addObject:self.arr2[self.index - 1]];
        [ar addObject:self.arr3[self.index - 1]];
        [ar addObject:self.arr4[self.index - 1]];
        [ar addObject:self.arr5[self.index - 1]];
        [ar addObject:self.arr6[self.index - 1]];
        [ar addObject:self.arr7[self.index - 1]];
        [ar addObject:self.arr8[self.index - 1]];
        [ar addObject:self.arr9[self.index - 1]];
        [ar addObject:self.arr10[self.index - 1]];
        [self bubbleSort:ar];
        NSMutableArray *result = [NSMutableArray array];
        for (int i = 0; i < ar.count; i++) {
            CGFloat tem = [ar[i] floatValue] - 100 * kScreenWidth;
            if (tem == a1) {
                [result addObject:@"1"];
            }else if (tem == a2) {
                [result addObject:@"2"];
            }else if (tem == a3) {
                [result addObject:@"3"];
            }else if (tem == a4) {
                [result addObject:@"4"];
            }else if (tem == a5) {
                [result addObject:@"5"];
            }else if (tem == a6) {
                [result addObject:@"6"];
            }else if (tem == a7) {
                [result addObject:@"7"];
            }else if (tem == a8) {
                [result addObject:@"8"];
            }else if (tem == a9) {
                [result addObject:@"9"];
            }else if (tem == a10) {
                [result addObject:@"10"];
            }
        }
        
        [self rankMove:@{@"short":result}];
    }
    NSMutableArray *acci = [NSMutableArray arrayWithArray:@[@1,@3,@6,@2]];
    [self bubbleSort:acci];
}
- (void)bubbleSort:(NSMutableArray *)list{
    if (list.count <= 1) {
        return;
    }
    int i, y;
    BOOL bFinish = YES; //是否发生数据交换
    for (i = 1; i<= [list count] && bFinish; i++) {
        bFinish = NO; //每次遍历时，重置标志
        //从最后一位开始，依次跟前一位相比，如果较小，则交换位置
        //当一次遍历没有任何数据交换时，则说明已经排序完成(bFinish=YES)，则不再进行循环
        for (y = (int)[list count]-1; y>=i; y--) {
            if ([[list objectAtIndex:y] intValue] < [[list objectAtIndex:y-1] intValue]) {
                //交换位置
                //    NSLog(@"%d<->%d",[[array objectAtIndex:y-1] intValue],[[array objectAtIndex:y] intValue]);
                [list exchangeObjectAtIndex:y-1 withObjectAtIndex:y];
                bFinish = YES; //发生数据交换，则继续进行下一次遍历，直到未发生数据交换或者循环完成为止
                
                //    NSLog(@"%@",[array componentsJoinedByString:@" "]);
            }
            
        }
    }
}
- (void)rankMove:(NSDictionary *)noti
{
    NSArray *array = noti[@"short"];
    for (int i = 0; i < array.count; i++) {
        NSNumber *nu = array[i];
        if ([nu integerValue] == 1) {
            self.rank1.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 2) {
            self.rank2.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 3)
        {
            self.rank3.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 4)
        {
            self.rank4.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 5)
        {
            self.rank5.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 6)
        {
            self.rank6.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 7)
        {
            self.rank7.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 8)
        {
            self.rank8.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 9)
        {
            self.rank9.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }else if (nu.integerValue == 10)
        {
            self.rank10.frame = CGRectMake(i * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
        }
    }

}

- (NSString *)gettime:(int)totalSeconds
{
    int seconds = totalSeconds % 60;
    int minutes = (totalSeconds / 60) % 60;
    int hours = totalSeconds / 3600;
    return [NSString stringWithFormat:@"%02d:%02d:%02d",hours, minutes, seconds];
}
- (void)timeFireMethod
{
    secondsCountDown--;
    self.mTimeLabel.text = [self gettime:secondsCountDown];
    self.mTimeLabel1.text = [self gettime:secondsCountDown];
    if (secondsCountDown == 0) {
        // 时间到了
        [countDownTimer invalidate];
        [self.mTimeLabel1 removeFromSuperview];
        [self.timeBGImageView removeFromSuperview];
        [self startAnimation];
        
        bgtimer = [NSTimer scheduledTimerWithTimeInterval:b - 1 target:self selector:@selector(bgtimerAction:) userInfo:nil repeats:NO];
        stopbgTimer = [NSTimer scheduledTimerWithTimeInterval:b + 10 target:self selector:@selector(stopbgTimerAction:) userInfo:nil repeats:NO];
    }
}
- (void)bgtimerAction:(NSTimer *)ti
{
    isBGHidden = YES;
    [self changeBackGround];
    [self.stageBGView getStageBGViewWithfirst:@"1" second:@"2" third:@"3"];
}
- (void)stopbgTimerAction:(NSTimer *)ti
{
    [bgtimer invalidate];
    isBGHidden = NO;
    [self changeBackGround];
    [stopbgTimer invalidate];
}
- (void)dealloc
{
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [countDownTimer invalidate];
    [rankTimer invalidate];
    [timer invalidate];
    [bgtimer invalidate];
    [stopbgTimer invalidate];
    [stopBTimer invalidate];
}
- (void)creatImageVIew
{
    secondsCountDown = time;
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 1; i < 11; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"赛道%d.jpg",i]];
        [array addObject:img];
    }
    
    self.imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_start.jpg"]];
    _imageView.frame = CGRectMake(0, 0, 720 * kScreenWidth, 542 * kScreenWidth);
    [self setAnimateion:array imgView:_imageView Duration:b-2];
    [self.scrollView addSubview:_imageView];
    
    self.timeBGImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"倒计时bg"]];
    self.timeBGImageView.frame = CGRectMake((CGRectGetWidth(self.view.frame) - 300 * kScreenWidth) / 2, 271 * kScreenWidth, 300 * kScreenWidth, 100 * kScreenWidth);
    [self.imageView addSubview:_timeBGImageView];
    
    self.mTimeLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.timeBGImageView.frame), CGRectGetHeight(self.timeBGImageView.frame))];
    self.mTimeLabel1.font = [UIFont systemFontOfSize:40 * kScreenWidth];
    self.mTimeLabel1.textColor = [UIColor whiteColor];
    self.mTimeLabel1.text = [self gettime:secondsCountDown];
    self.mTimeLabel1.textAlignment = NSTextAlignmentCenter;
    [self.timeBGImageView addSubview:self.mTimeLabel1];
    
    self.rank1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"1"]];
    self.rank1.frame = CGRectMake(58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank1];
    
    self.rank2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2"]];
    self.rank2.frame = CGRectMake(1 * 55 * kScreenWidth + 58* kScreenWidth, CGRectGetMinY(_rank1.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank2];
    
    self.rank3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"3"]];
    self.rank3.frame = CGRectMake(2 * 55 * kScreenWidth + 58* kScreenWidth, CGRectGetMinY(_rank2.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank3];
    
    self.rank4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"4"]];
    self.rank4.frame = CGRectMake(3 * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank4];
    
    self.rank5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"5"]];
    self.rank5.frame = CGRectMake(4 * 55 * kScreenWidth + 58 * kScreenWidth, CGRectGetMinY(_rank1.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank5];
    
    self.rank6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"6"]];
    self.rank6.frame = CGRectMake(5 * 55 * kScreenWidth + 58 * kScreenWidth, CGRectGetMinY(_rank2.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank6];
    self.rank7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"7"]];
    self.rank7.frame = CGRectMake(6 * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank7];
    
    self.rank8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"8"]];
    self.rank8.frame = CGRectMake(7 * 55 * kScreenWidth + 58 * kScreenWidth, CGRectGetMinY(_rank7.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank8];
    
    self.rank9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"9"]];
    self.rank9.frame = CGRectMake(8 * 55 * kScreenWidth + 58 * kScreenWidth, CGRectGetMinY(_rank8.frame), 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank9];
    
    self.rank10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"10"]];
    self.rank10.frame = CGRectMake(9 * 55 * kScreenWidth + 58 * kScreenWidth, 25 * kScreenWidth, 44 * kScreenWidth, 44 * kScreenWidth);
    [self.imageView addSubview:_rank10];

    NSMutableArray *array1 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑1-%d",i + 1]];
        [array1 addObject:img];
    }
    NSMutableArray *array2 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑2-%d",i + 1]];
        [array2 addObject:img];
    }
    NSMutableArray *array3 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑3-%d",i + 1]];
        [array3 addObject:img];
    }
    NSMutableArray *array4 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑4-%d",i + 1]];
        [array4 addObject:img];
    }
    NSMutableArray *array5 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑5-%d",i + 1]];
        [array5 addObject:img];
    }
    NSMutableArray *array6 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑6-%d",i + 1]];
        [array6 addObject:img];
    }
    NSMutableArray *array7 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑7-%d",i + 1]];
        [array7 addObject:img];
    }
    NSMutableArray *array8 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑8-%d",i + 1]];
        [array8 addObject:img];
    }
    NSMutableArray *array9 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑9-%d",i + 1]];
        [array9 addObject:img];
    }
    NSMutableArray *array10 = [NSMutableArray array];
    for (int i = 0; i < 6; i++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"马跑10-%d",i + 1]];
        [array10 addObject:img];
    }
    
    self.imgView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止1"]];
    _imgView1.frame = CGRectMake(540 * kScreenWidth, 123 * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView1.animationImages = array1;
    [_imageView addSubview:_imgView1];
    
    self.imgView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止2"]];
    _imgView2.frame = CGRectMake(540 * kScreenWidth, (123 + 36) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView2.animationImages = array2;
    [_imageView addSubview:_imgView2];
    
    self.imgView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止3"]];
    _imgView3.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 2) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView3.animationImages = array3;
    [_imageView addSubview:_imgView3];
    
    self.imgView4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止4"]];
    _imgView4.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 3) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView4.animationImages = array4;
    [_imageView addSubview:_imgView4];
    
    self.imgView5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止5"]];
    _imgView5.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 4) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView5.animationImages = array5;
    [_imageView addSubview:_imgView5];
    
    self.imgView6 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止6"]];
    _imgView6.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 5) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView6.animationImages = array6;
    
    [_imageView addSubview:_imgView6];
    
    self.imgView7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止7"]];
    _imgView7.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 6) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView7.animationImages = array7;
    
    [_imageView addSubview:_imgView7];
    
    self.imgView8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止8"]];
    _imgView8.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 7) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView8.animationImages = array8;
    [_imageView addSubview:_imgView8];
    
    self.imgView9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止9"]];
    _imgView9.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 8) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView9.animationImages = array9;
    
    
    
    [_imageView addSubview:_imgView9];
    
    self.imgView10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"马跑静止10"]];
    _imgView10.frame = CGRectMake(540 * kScreenWidth, (123 + 36 * 9) * kScreenWidth, 110 * kScreenWidth, 78 * kScreenWidth);
    self.imgView10.animationImages = array10;
    
    
    
    [_imageView addSubview:_imgView10];
    
    
    
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame), 720 * kScreenWidth, 118 * kScreenWidth)];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.tag = 1000;
    [self.scrollView addSubview:bgView];
    
    UIView *numberView = [[UIView alloc] initWithFrame:CGRectMake(21 * kScreenWidth, 7 * kScreenWidth, 330 * kScreenWidth, 100 * kScreenWidth)];
    numberView.backgroundColor = [UIColor blackColor];
    numberView.layer.borderColor = [UIColor colorWithRed:0.6078 green:0.6941 blue:0.8392 alpha:1.0].CGColor;
    numberView.layer.borderWidth = 0.5;
    [bgView addSubview:numberView];
    UILabel *numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 * kScreenWidth, 0 * kScreenWidth, 330 * kScreenWidth, 46 * kScreenWidth)];
    numberLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    numberLabel.backgroundColor = [UIColor colorWithRed:0.1686 green:0.2039 blue:0.2667 alpha:1.0];
    numberLabel.textColor = [UIColor colorWithRed:0.6078 green:0.6941 blue:0.8392 alpha:1.0];
    numberLabel.text = @"期号";
    numberLabel.textAlignment = NSTextAlignmentCenter;
    [numberView addSubview:numberLabel];
    
    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(numberLabel.frame), 330 * kScreenWidth, 54 * kScreenWidth)];
    _dateLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.dateLabel.textColor = [UIColor whiteColor];
    self.dateLabel.textAlignment = NSTextAlignmentCenter;
    self.dateLabel.text = @"2016/7/8";
    [numberView addSubview:self.dateLabel];
    
    UIView *csumView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(numberView.frame) + 18 * kScreenWidth, CGRectGetMinY(numberView.frame), CGRectGetWidth(numberView.frame), CGRectGetHeight(numberView.frame))];
    csumView.backgroundColor = [UIColor blackColor];
    csumView.layer.borderColor = [UIColor colorWithRed:0.6078 green:0.6941 blue:0.8392 alpha:1.0].CGColor;
    csumView.layer.borderWidth = 0.5;
    [bgView addSubview:csumView];
    UILabel *csumLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 * kScreenWidth, 0 * kScreenWidth, 330 * kScreenWidth, 46 * kScreenWidth)];
    csumLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    csumLabel.backgroundColor = [UIColor colorWithRed:0.1686 green:0.2039 blue:0.2667 alpha:1.0];
    csumLabel.textColor = [UIColor colorWithRed:0.6078 green:0.6941 blue:0.8392 alpha:1.0];
    csumLabel.text = @"冠亚军和";
    csumLabel.textAlignment = NSTextAlignmentCenter;
    [csumView addSubview:csumLabel];
    
    self.csumLabel1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(csumLabel.frame), 108 * kScreenWidth, 54 * kScreenWidth)];
    self.csumLabel1.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.csumLabel1.text = @"10";
    self.csumLabel1.textAlignment = NSTextAlignmentCenter;
    self.csumLabel1.textColor = [UIColor whiteColor];
    [csumView addSubview:_csumLabel1];
    
    UIView *line1 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.csumLabel1.frame), CGRectGetMaxY(csumLabel.frame) + 7 * kScreenWidth, 0.5, 40 * kScreenWidth)];
    line1.backgroundColor = [UIColor colorWithRed:0.1686 green:0.2039 blue:0.2667 alpha:1.0];
    [csumView addSubview:line1];
    
    self.csumLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line1.frame), CGRectGetMinY(self.csumLabel1.frame), 108 * kScreenWidth, 54 * kScreenWidth)];
    self.csumLabel2.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.csumLabel2.text = @"小";
    self.csumLabel2.textAlignment = NSTextAlignmentCenter;
    self.csumLabel2.textColor = [UIColor whiteColor];
    [csumView addSubview:_csumLabel2];
    
    
    UIView *line2 = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.csumLabel2.frame),CGRectGetMaxY(csumLabel.frame) + 7 * kScreenWidth, 0.5, 40 * kScreenWidth)];
    line2.backgroundColor = [UIColor colorWithRed:0.1686 green:0.2039 blue:0.2667 alpha:1.0];
    [csumView addSubview:line2];
    
    self.csumLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(line2.frame), CGRectGetMinY(self.csumLabel1.frame), 108 * kScreenWidth, 54 * kScreenWidth)];
    self.csumLabel3.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.csumLabel3.text = @"双";
    self.csumLabel3.textAlignment = NSTextAlignmentCenter;
    self.csumLabel3.textColor = [UIColor whiteColor];
    [csumView addSubview:_csumLabel3];
    
    UIView *bgView2 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(bgView.frame) + 21 * kScreenWidth, 720 * kScreenWidth, 204 * kScreenWidth)];
    bgView2.backgroundColor = [UIColor whiteColor];
    bgView2.tag = 1001;
    [self.scrollView addSubview:bgView2];
    
    self.numberLabel1 = [UILabel new];
    self.numberLabel1.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.numberLabel1.textAlignment = NSTextAlignmentCenter;
    self.numberLabel1.text = @"第561453期";
    [bgView2 addSubview:self.numberLabel1];
    
    self.numberLabel1.sd_layout
    .topSpaceToView(bgView2,21 * kScreenWidth)
    .leftSpaceToView(bgView2,21 * kScreenWidth)
    .widthIs(28 * kScreenWidth)
    .heightIs(28 * kScreenWidth);
    [self.numberLabel1 setSingleLineAutoResizeWithMaxWidth:300 * kScreenWidth];
    self.timeLabel = [UILabel new];
    self.timeLabel.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    self.timeLabel.text = @"倒计时：";
    [bgView2 addSubview:self.timeLabel];
    self.timeLabel.sd_layout
    .topEqualToView(self.numberLabel1)
    .leftSpaceToView(self.numberLabel1,35 * kScreenWidth)
    .widthIs(4 * 28 *kScreenWidth)
    .heightIs(28 * kScreenWidth);
    self.mTimeLabel = [UILabel new];
    self.mTimeLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    [bgView2 addSubview:_mTimeLabel];
    self.mTimeLabel.sd_layout
    .topEqualToView(self.timeLabel)
    .leftSpaceToView(self.timeLabel,0)
    .widthIs(6 * 28 * kScreenWidth)
    .heightIs(28 * kScreenWidth);
    self.numberLabel2 = [UILabel new];
    self.numberLabel2.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    self.numberLabel2.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
    self.numberLabel2.text = @"第561452期";
    [bgView2 addSubview:_numberLabel2];
    
    self.numberLabel2.sd_layout
    .topSpaceToView(self.numberLabel1,29 * kScreenWidth)
    .leftEqualToView(self.numberLabel1)
    .widthIs(28 * kScreenWidth)
    .heightIs(28 * kScreenWidth);
    [self.numberLabel2 setSingleLineAutoResizeWithMaxWidth:300 * kScreenWidth];
   
    self.resultLabel = [UILabel new];
    self.resultLabel.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
    self.resultLabel.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    self.resultLabel.text = @"开奖结果：";
    [bgView2 addSubview:self.resultLabel];
    
    self.resultLabel.sd_layout
    .topEqualToView(self.numberLabel2)
    .leftSpaceToView(self.numberLabel2,35 * kScreenWidth)
    .widthIs(28 * 5 * kScreenWidth)
    .heightIs(28 * kScreenWidth);
    
    self.mResultLabel = [UILabel new];
    self.mResultLabel.textColor = [UIColor colorWithRed:0.9961 green:0.3255 blue:0.1882 alpha:1.0];
    self.mResultLabel.font = [UIFont systemFontOfSize:27 * kScreenWidth];
    self.mResultLabel.text = @"10.9.6.3.4.2.1.8.5.7";
    [bgView2 addSubview:_mResultLabel];
    
    self.mResultLabel.sd_layout
    .topEqualToView(self.resultLabel)
    .leftSpaceToView(self.resultLabel,0)
    .widthIs(240 * kScreenWidth)
    .heightIs(28 * kScreenWidth);
    
    
    UIButton *historyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [historyButton setBackgroundImage:[UIImage imageNamed:@"历史比赛记录"] forState:UIControlStateNormal];
    [historyButton addTarget:self action:@selector(historyButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView2 addSubview:historyButton];
    historyButton.sd_layout
    .topSpaceToView(self.mResultLabel,24 * kScreenWidth)
    .rightSpaceToView(bgView2,20 * kScreenWidth)
    .widthIs(181 * kScreenWidth)
    .heightIs(57 * kScreenWidth);
    
    UIButton *showButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showButton setBackgroundImage:[UIImage imageNamed:@"盈亏显示"] forState:UIControlStateNormal];
    [showButton addTarget:self action:@selector(showButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [bgView2 addSubview:showButton];
    
    showButton.sd_layout
    .topEqualToView(historyButton)
    .rightSpaceToView(historyButton,14 * kScreenWidth)
    .widthIs(144 * kScreenWidth)
    .heightIs(57 * kScreenWidth);
    
    
    
}
- (void)changeBackGround
{
    if (isBGHidden) {
        self.stageBGView = [[StageBGView alloc] initWithFrame:CGRectMake(0, 45 * kScreenWidth, 720 * kScreenWidth, 443 * kScreenWidth)];
        [self.imageView addSubview:self.stageBGView];
        self.imgView1.hidden = YES;
        self.imgView2.hidden = YES;
        self.imgView3.hidden = YES;
        self.imgView4.hidden = YES;
        self.imgView5.hidden = YES;
        self.imgView6.hidden = YES;
        self.imgView7.hidden = YES;
        self.imgView8.hidden = YES;
        self.imgView9.hidden = YES;
        self.imgView10.hidden = YES;
         
    }else
    {
        [self.stageBGView removeFromSuperview];
        self.imgView1.hidden = NO;
        self.imgView2.hidden = NO;
        self.imgView3.hidden = NO;
        self.imgView4.hidden = NO;
        self.imgView5.hidden = NO;
        self.imgView6.hidden = NO;
        self.imgView7.hidden = NO;
        self.imgView8.hidden = NO;
        self.imgView9.hidden = NO;
        self.imgView10.hidden = NO;
        [timer invalidate];
        UIView *view1 = [self.view viewWithTag:1000];
        UIView *view2 = [self.view viewWithTag:1001];
        
        [self.imageView removeFromSuperview];
        [view1 removeFromSuperview];
        [view2 removeFromSuperview];
       
        [self creatImageVIew];
        secondsCountDown = time;
        countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        self.mTimeLabel.text = [self gettime:secondsCountDown];
        
    }
    
}

- (void)createExcel
{
    self.sengMent = [[XLSegmentView alloc] initWithFrame:CGRectMake(0, 883 * kScreenWidth + 21 * kScreenWidth, self.view.frame.size.width, 61 * kScreenWidth) withTitleArr:@[@"冠军和",@"冠军",@"亚军",@"第三名",@"第四名",@"第五名",@"第六名",@"第七名",@"第八名",@"第九名",@"第十名"]];
    
    _sengMent.backgroundColor = [UIColor whiteColor];
    
    //    __weak XLSegmentView *weakSengment = _sengMent;
    ace = @"1";
    [self.scrollView addSubview:_sengMent];
    self.xlfor1 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor1.dataSource = self;
    _xlfor1.delegate = self;
    [self.scrollView addSubview:_xlfor1];
    self.xlfor2 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor2.dataSource = self;
    _xlfor2.delegate = self;
    [self.scrollView addSubview:_xlfor2];
    self.xlfor3 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor3.dataSource = self;
    _xlfor3.delegate = self;
    [self.scrollView addSubview:_xlfor3];
    self.xlfor4 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor4.dataSource = self;
    _xlfor4.delegate = self;
    [self.scrollView addSubview:_xlfor4];
    self.xlfor5 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor5.dataSource = self;
    _xlfor5.delegate = self;
    [self.scrollView addSubview:_xlfor5];
    self.xlfor6 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor6.dataSource = self;
    _xlfor6.delegate = self;
    [self.scrollView addSubview:_xlfor6];
    self.xlfor7 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor7.dataSource = self;
    _xlfor7.delegate = self;
    [self.scrollView addSubview:_xlfor7];
    self.xlfor8 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor8.dataSource = self;
    _xlfor8.delegate = self;
    [self.scrollView addSubview:_xlfor8];
    self.xlfor9 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor9.dataSource = self;
    _xlfor9.delegate = self;
    [self.scrollView addSubview:_xlfor9];
    self.xlfor10 = [[XLFormView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_sengMent.frame), self.view.frame.size.width, 0)];
    _xlfor10.dataSource = self;
    _xlfor10.delegate = self;
    [self.scrollView addSubview:_xlfor10];
    
    self.xiazhuButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.xiazhuButton setTitle:@"下注" forState:UIControlStateNormal];
    [self.xiazhuButton setBackgroundColor:kAppColor];
    [self.xiazhuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(self.xlfor1.frame) + 40 * kScreenWidth, CGRectGetWidth(self.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
    
    [self.xiazhuButton addTarget:self action:@selector(xiazhuButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:_xiazhuButton];
    self.xlfor1.hidden = NO;
    self.xlfor2.hidden = YES;
    self.xlfor3.hidden = YES;
    self.xlfor4.hidden = YES;
    self.xlfor5.hidden = YES;
    self.xlfor6.hidden = YES;
    self.xlfor7.hidden = YES;
    self.xlfor8.hidden = YES;
    self.xlfor9.hidden = YES;
    self.xlfor10.hidden = YES;
    __weak typeof(self) weakSelf = self;
    [_sengMent setSegmentBlock:^(NSInteger segmentNum, XLBgView *btn) {
        
        ace = @"2";
        [weakSelf.xlfor1 reloadExcelData];
        if (segmentNum == 0)
        {
            weakSelf.xlfor1.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (21 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor1.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }
        else if (segmentNum == 1)
        {
            weakSelf.xlfor2.hidden = NO;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor2.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }
        else if (segmentNum == 2)
        {
            weakSelf.xlfor3.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor3.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }
        else if (segmentNum == 3)
        {
            weakSelf.xlfor4.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor4.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 4)
        {
            weakSelf.xlfor5.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor5.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 5)
        {
            weakSelf.xlfor6.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor6.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 6)
        {
            weakSelf.xlfor7.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor7.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 7)
        {
            weakSelf.xlfor8.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor8.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 8)
        {
            weakSelf.xlfor9.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.xlfor10.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor9.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }else if (segmentNum == 9)
        {
            weakSelf.xlfor10.hidden = NO;
            weakSelf.xlfor2.hidden = YES;
            weakSelf.xlfor3.hidden = YES;
            weakSelf.xlfor4.hidden = YES;
            weakSelf.xlfor5.hidden = YES;
            weakSelf.xlfor6.hidden = YES;
            weakSelf.xlfor7.hidden = YES;
            weakSelf.xlfor8.hidden = YES;
            weakSelf.xlfor9.hidden = YES;
            weakSelf.xlfor1.hidden = YES;
            weakSelf.scrollView.contentSize = CGSizeMake(weakSelf.view.frame.size.width, 1100 * kScreenWidth + (10 * 60 * kScreenWidth));
            weakSelf.xiazhuButton.frame = CGRectMake(18 * kScreenWidth, CGRectGetMaxY(weakSelf.xlfor10.frame) + 40 * kScreenWidth, CGRectGetWidth(weakSelf.view.frame) - 36 * kScreenWidth, 69 * kScreenWidth);
        }
        
        
    }];
    
}
#pragma mark 下注
- (void)xiazhuButtonAction:(UIButton *)sender
{
    [self.xlfor1 clearTextInputData];
    [self.xlfor2 clearTextInputData];
    [self.xlfor3 clearTextInputData];
    [self.xlfor4 clearTextInputData];
    [self.xlfor5 clearTextInputData];
    [self.xlfor6 clearTextInputData];
    [self.xlfor7 clearTextInputData];
    [self.xlfor8 clearTextInputData];
    [self.xlfor9 clearTextInputData];
    [self.xlfor10 clearTextInputData];
}
- (NSInteger)numberOfRowsInFormView:(XLFormView *)formView
{
    if (formView == self.xlfor1) {
        return 21;
    }else
    {
        return 10;
    }
    
}
- (NSInteger)formViewColumnsInRow:(XLFormView *)formView
{
    return 3;
}
- (NSString *)formView:(XLFormView *)formView textForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (formView == self.xlfor1) {
        switch (column) {
            case 0:
                return self.titles[row];
                break;
            case 1:
                return ace;
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor2)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.8";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor3)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.1";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor4)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.0";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor5)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.2";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor6)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.7";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor7)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.7";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor8)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.1";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else if (formView == self.xlfor9)
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.7";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
        
    }else
    {
        switch (column) {
            case 0:
                return self.titles1[row];
                break;
            case 1:
                return @"9.7";
                break;
            case 2:
                return @"";
                break;
            default:
                return 0;
                break;
        }
    }
    
}
- (UIColor *)formView:(XLFormView *)formView colorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    return [UIColor whiteColor];
}
- (UIColor *)formView:(XLFormView *)formView contentColorOfColumn:(NSInteger)column inRow:(NSInteger)row
{
    return [UIColor blackColor];
}
- (CGFloat)formView:(XLFormView *)formView heightForRow:(NSInteger)row
{
    return 60 * kScreenWidth;
}
- (void)getEditArray:(NSArray *)editArray formView:(XLFormView *)formView
{
    if (formView == self.xlfor2) {
        
    }
    
}
- (BOOL)formView:(XLFormView *)formView addActionForColumn:(NSInteger)column inRow:(NSInteger)row
{
    if (column == 2) {
        return YES;
    }
    return NO;
}
- (BOOL)getColumn:(NSInteger)column
{
    if (column == 2) {
        return YES;
    }
    return NO;
}
- (CGFloat)formView:(XLFormView *)formView widthForColumn:(NSInteger)column
{
    return formView.bounds.size.width  / 3.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 历史比赛记录
- (void)historyButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[ProfitAndLossViewDetailViewController new] animated:YES];
}
#pragma mark 盈亏显示
- (void)showButtonAction:(UIButton *)sender
{
    [self.navigationController pushViewController:[ProfitAndLossViewController new] animated:YES];
}
- (void)timerAACiton:(NSTimer *)ti
{
    idnex++;
    NSLog(@"时间及时器：%d",idnex);
}
- (void)stopBTimerAction:(NSTimer *)ti
{
    [_imageView stopAnimating];
    self.imageView.image = [UIImage imageNamed:@"bg_end.jpg"];
}

#pragma mark 开始动画
- (void)startAnimation
{
    idnex = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAACiton:) userInfo:nil repeats:YES];
    CGFloat f = 100 * kScreenWidth;
    [_imageView startAnimating];
    
    stopBTimer = [NSTimer scheduledTimerWithTimeInterval:b - 12 target:self selector:@selector(stopBTimerAction:) userInfo:nil repeats:NO];
   
    [CoreAnimationEffect animationMoveLeft:_imgView1 duration:b endPoint:f rank:@"1"];
    [self stopAnimateion:self.imgView1 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView2 duration:b endPoint:f rank:@"2"];
    [self stopAnimateion:self.imgView2 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView3 duration:b endPoint:f rank:@"3"];
    [self stopAnimateion:self.imgView3 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView4 duration:b endPoint:f rank:@"4"];
    [self stopAnimateion:self.imgView4 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView5 duration:b endPoint:f rank:@"5"];
    [self stopAnimateion:self.imgView5 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView6 duration:b endPoint:f rank:@"6"];
    [self stopAnimateion:self.imgView6 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView7 duration:b endPoint:f rank:@"7"];
    [self stopAnimateion:self.imgView7 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView8 duration:b endPoint:f rank:@"8"];
    [self stopAnimateion:self.imgView8 duration:b];
    
    [CoreAnimationEffect animationMoveLeft:_imgView9 duration:b endPoint:f rank:@"9"];
    [self stopAnimateion:self.imgView9 duration:b];
    //
    [CoreAnimationEffect animationMoveLeft:_imgView10 duration:b endPoint:f rank:@"10"];
    [self stopAnimateion:self.imgView10 duration:b];
    [CoreAnimationEffect postRank:^(id value) {
        self.arr1 = [NSMutableArray arrayWithArray:value[@"1"]];
        self.arr2 = [NSMutableArray arrayWithArray:value[@"2"]];
        self.arr3 = [NSMutableArray arrayWithArray:value[@"3"]];
        self.arr4 = [NSMutableArray arrayWithArray:value[@"4"]];
        self.arr5 = [NSMutableArray arrayWithArray:value[@"5"]];
        self.arr6 = [NSMutableArray arrayWithArray:value[@"6"]];
        self.arr7 = [NSMutableArray arrayWithArray:value[@"7"]];
        self.arr8 = [NSMutableArray arrayWithArray:value[@"8"]];
        self.arr9 = [NSMutableArray arrayWithArray:value[@"9"]];
        self.arr10 = [NSMutableArray arrayWithArray:value[@"10"]];
        rankTimer = [NSTimer scheduledTimerWithTimeInterval:(b - 10) / 40 target:self selector:@selector(rankAction:) userInfo:nil repeats:YES];
    }];
}
- (void)setAnimateion:(NSArray*)imageArray imgView:(UIImageView *)imgView Duration:(NSInteger)duration
{
    //    float a = 10;
    imgView.animationImages = imageArray;
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.values = imageArray;
    keyAnimation.removedOnCompletion=NO;
    keyAnimation.fillMode=kCAFillModeForwards;
    keyAnimation.duration = duration;
    keyAnimation.repeatCount = 1;
    keyAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [imgView.layer addAnimation:keyAnimation forKey:nil];
    imgView.layer.speed = 0.25;
    //    imgView.layer.speed = 0.4;
    //    imgView.animationImages = imageArray;
    //    [imgView setAnimationDuration:(imageArray.count / a)];
    //    [imgView setAnimationRepeatCount:(duration/(imageArray.count / a))];
}
- (void)stopAnimateion:(UIImageView *)imageView duration:(CGFloat)duration
{
    NSLog(@"%.2f",duration);
    [imageView startAnimating];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imageView stopAnimating];
        //        [imageView.layer removeAllAnimations];
    });
}
- (NSArray *)titles
{
    if (!_titles) {
        _titles = @[@"大",@"小",@"单",@"双",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19"];
    }
    return _titles;
}
- (NSArray *)titles1
{
    if (!_titles1) {
        _titles1 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
    }
    return _titles1;
}


@end
