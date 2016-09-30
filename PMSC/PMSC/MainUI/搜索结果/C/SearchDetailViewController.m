//
//  SearchDetailViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/8.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "SearchDetailView.h"
#import "ShopCollectionViewCell.h"
#import "SearchModel.h"
#import "ShopViewViewController.h"
@interface SearchDetailViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    int j;//总页数
}
@property(nonatomic,retain)SearchDetailView *sdView;
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic,retain)UIView *bView;
@property(nonatomic,retain)NSMutableArray *dataArr;

@end

static int i= 1;
@implementation SearchDetailViewController
-(SearchDetailView *)sdView
{
    if (!_sdView) {
        self.sdView = [[SearchDetailView alloc] initWithFrame:self.view.bounds];
        self.sdView.collectionView .delegate = self;
        self.sdView.collectionView.dataSource = self;
    }
    return _sdView;
}
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
        //        self.rowArr =[@[@"0",@"0",@"0",@"0"] mutableCopy];
    }
    return _rowArr;
}
-(NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.navigationController.navigationBarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{[super viewWillDisappear:YES];
//    self.navigationController.navigationBarHidden = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.sdView];
    
    [self.sdView.collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self bottom];
    
    self.bView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bottomisHiden) name:@"底部视图是否隐藏" object:nil];
        NSLog(@"%@",self.searchText);
    [self loadwithKey:self.searchText];
    
    [self.sdView.collectionView.mj_header beginRefreshing];
    
    
    self.sdView.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //刷新表格
        [self headerRereshing];
    }];
    
    self.sdView.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //刷新表格
        [self footerRereshing];
    }];
    
}
- (void)headerRereshing
{
    i = 1;
    [self loadwithKey:self.searchText];
}
- (void)footerRereshing
{
    if (i != j) {
        i++;
       [self loadwithKey:self.searchText];
    } else {
        [self.sdView.collectionView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}


-(void)loadwithKey:(NSString *)k
{
    __weak typeof (SearchDetailViewController ) *waks = self;
    
    
    [SearchModel setSearchWithKey:k WithP:i WithBLOCK:^(id returnValue,id page) {
        if(i == 1)
        {
            [waks.dataArr removeAllObjects];
        }
        [waks.dataArr addObjectsFromArray: returnValue];
        j = [[NSString stringWithFormat:@"%@",page] intValue];
        
        for (int i =0; i<_dataArr.count; i++) {
            [waks.rowArr addObject:@"0"];
        }
        [waks.sdView.collectionView reloadData];
        [waks.sdView.collectionView .mj_footer endRefreshing];
        [waks.sdView.collectionView.mj_header endRefreshing];
        
    }];
}
-(void)creatNavi
{
    UIView *naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    naviView.backgroundColor = kAppColor;
    [self.view addSubview:naviView];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    //    leftBtn.backgroundColor = [UIColor yellowColor];
    leftBtn.frame = CGRectMake(20, 20+12, 10, 20);
    [leftBtn setImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    [leftBtn  addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:leftBtn];
    
}
-(void)goBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    
    SearchModel *m= _dataArr[indexPath.row];
    cell.title.text = [NSString stringWithFormat:@"(第%@期)%@",m.periods,m.title];
    cell.total.text =[NSString stringWithFormat:@"总量:%@ 剩余%@",m.total,m.remain];
    cell.valueLb.text = [NSString stringWithFormat:@"价值:%@",m.money];
    cell.buttonSubtract .tag = indexPath.row +10000;
    cell.buttonAdd .tag = indexPath.row +10000;
    cell.quantity.text =self.rowArr[indexPath.row];
    [cell.buttonAdd addTarget:self action:@selector(jiahao:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonSubtract addTarget:self action:@selector(jianhao:) forControlEvents:UIControlEventTouchUpInside];
    if(![cell.quantity.text isEqualToString:@"0"])
    {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"底部视图是否隐藏" object:nil];
        
    }
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopViewViewController *sVC = [ShopViewViewController new];
    sVC.sId = [_dataArr[indexPath.item] ID];
    [self.navigationController pushViewController:sVC animated:YES];
    
}
//加号方法
-(void)jiahao:(UIButton *)jia
{
    NSInteger b = [[self.rowArr objectAtIndex:jia.tag - 10000] integerValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.sdView.collectionView reloadData];
    //    self .bView.hidden = NO;
    
}
//减号方法
-(void)jianhao:(UIButton *)jian
{ NSInteger b = [[self.rowArr objectAtIndex:jian.tag - 10000] integerValue];
    
    if(b> 0)
    {
        b--;
        [self.rowArr replaceObjectAtIndex:jian.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
        
        [self.sdView.collectionView reloadData];
        
    }
    
}
-(void)bottomisHiden
{
    self.bView.hidden = NO;
    
}

-(void)bottom
{
    
    self.bView = [UIView new];
    [self.view addSubview:self.bView];
    
    _bView.sd_layout
    .leftSpaceToView(self.view,0)
    .bottomSpaceToView(self.view,50)
    .rightSpaceToView(self.view,0)
    .heightIs(90 *kScreenHeight);
    
    self.bView.backgroundColor = [UIColor whiteColor];
    UIImageView *total = [[UIImageView alloc] initWithFrame:CGRectMake(30 *kScreenWidth, 20*kScreenHeight, 70 *kScreenWidth, 50*kScreenHeight)];
    [self.bView addSubview:total];
    total.image = [UIImage imageNamed:@"redgouwuche@3x"];
    //    total.textColor = RGBA(255, 85, 0, 1);
    UILabel *count =[[ UILabel alloc] initWithFrame:CGRectMake(total.right+ 30 *kScreenWidth, 0, 400 *kScreenWidth, self.bView.frame.size.height)];
    [self.bView addSubview:count];
    count.font = [ UIFont systemFontOfSize:30 *kScreenWidth];
    count.text = @"合计: 300";
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bView addSubview:btn];
    [btn setImage:[UIImage imageNamed:@"继续购买@3x"] forState:0];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.bView addSubview:btn1];
    [btn1 setImage:[UIImage imageNamed:@"结算@3x"] forState:0];
    btn.frame = CGRectMake(400*kScreenWidth, 0, 158*kScreenWidth, 90*kScreenHeight);
    btn1.frame = CGRectMake(btn.right-15*kScreenWidth, 0, 176*kScreenWidth, 90*kScreenHeight);
    [btn addTarget:self action:@selector(continuebuy) forControlEvents:UIControlEventTouchUpInside];
    [btn1 addTarget:self action:@selector(jiesuan) forControlEvents:UIControlEventTouchUpInside];
    
    
}
-(void)continuebuy
{
    //继续购买
}
-(void)jiesuan
{
    //结算
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
