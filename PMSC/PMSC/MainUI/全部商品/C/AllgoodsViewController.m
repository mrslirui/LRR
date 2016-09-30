//
//  AllgoodsViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/31.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AllgoodsViewController.h"
#import "BuyGoodThingView.h"
#import "ListTableViewCell.h"
#import "ShopCollectionViewCell.h"
#import "ShowCollectionViewCell.h"
#import "ShopViewViewController.h"
#import "ShopCarViewController.h"
#import "SearchView.h"
#import "SearchViewController.h"
#import "AllgoodModel.h"
#import "LoginViewController.h"
@interface AllgoodsViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UITextFieldDelegate>
{
    NSInteger select;
    SearchView  *search;
      int j;
    NSInteger index;
}
@property (nonatomic, strong) BuyGoodThingView *buyGoodThingView;
@property (nonatomic, strong) NSMutableArray *dataClassArray;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic,retain)UITableView *searchTableView;


@end
static int i = 1;
@implementation AllgoodsViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
-(void)viewWillDisappear:(BOOL)animated

{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}
-(BuyGoodThingView *)buyGoodThingView
{
    if (!_buyGoodThingView) {
        _buyGoodThingView = [[BuyGoodThingView alloc] initWithFrame:CGRectMake(0, 44, Screen_WIDTH, Screen_HEIGHT)];
        _buyGoodThingView.listTableView.delegate = self;
        _buyGoodThingView.listTableView.dataSource = self;
        _buyGoodThingView.showCollectionView.dataSource =self;
        _buyGoodThingView.showCollectionView.delegate = self;
    }
    return _buyGoodThingView;
}

- (NSMutableArray *)dataClassArray
{
    if (!_dataClassArray) {
        self.dataClassArray = [NSMutableArray array];
    }
    return _dataClassArray;
}
- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
    }
    return _rowArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.buyGoodThingView];
    [self creatNavi];
    
    self.searchTableView.hidden = YES;
    //    self.dataClassArray = [@[@"全部",@"一元",@"特惠",@"限购",@"极速"] mutableCopy];
    [self.buyGoodThingView.listTableView registerClass:[ListTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.buyGoodThingView.listTableView.bounces = NO;
    self.buyGoodThingView.showCollectionView.backgroundColor = RGBA(239, 239, 239, 1);
    [self.buyGoodThingView.showCollectionView registerClass:[ShowCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    //    for (int i = 0; i< _dataClassArray.count; i++) {
    //        if ([_dataClassArray[i] isEqualToString:self.secStr]) {
    //            select = i;
    //        }
    //    }
    select = 0;
    
    __weak typeof (AllgoodsViewController ) *waks = self;
    
    [AllgoodModel setBlockWithReturnBlock:^(id returnValue) {
        waks.dataClassArray = returnValue;
        NSLog(@"%@",waks.dataClassArray);
       AllgoodModel *model = waks.dataClassArray[0];
        [waks loadId:model.cateid];
        [waks.buyGoodThingView.listTableView reloadData];
        
    }];
    
    
    [self.buyGoodThingView.showCollectionView.mj_header beginRefreshing];
    
    
    self.buyGoodThingView.showCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //刷新表格
        [self headerRereshing];
    }];
    
    self.buyGoodThingView.showCollectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        //刷新表格
        [self footerRereshing];
    }];
    
}
- (void)headerRereshing
{
    i = 1;
   
    AllgoodModel *m = _dataClassArray [select];
    [self loadId:m.cateid];
    
}
- (void)footerRereshing
{
    if (i != j) {
        i++;
              AllgoodModel  *m = _dataClassArray [select];
        [self loadId:m.cateid];

    } else {
        [self.buyGoodThingView.showCollectionView.mj_footer setState:MJRefreshStateNoMoreData];
    }
}


#pragma mark -加载数据
-(void)loadId:(NSString *)gid
{
    __weak typeof (AllgoodsViewController ) *waks = self;
    
    [AllgoodModel setBlockListWithid:[gid intValue] withP:i ReturnBlock:^(id returnValue,id page) {
        if (i == 1) {
            [waks.dataArray removeAllObjects];
        }
        
        [waks.dataArray addObjectsFromArray: returnValue];
        j = [[NSString stringWithFormat:@"%@",page] intValue];
        NSLog(@"%d",j);
        for (int i= 0; i<_dataArray.count ; i++) {
            
            [waks.rowArr addObject:@"0"];
        }
        
        [waks.buyGoodThingView.showCollectionView reloadData];
        [waks.buyGoodThingView.showCollectionView.mj_header endRefreshing];
        [waks.buyGoodThingView.showCollectionView.mj_footer endRefreshing];
    }];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{     return _dataClassArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{     ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        AllgoodModel *m= self.dataClassArray[indexPath.row];
    if (indexPath.row == select) {
        cell.nameLabel.text =m.name;
        cell.nameLabel.textColor = kAppColor;
        cell.contentView.backgroundColor = [UIColor whiteColor];
        cell.selectView.hidden = NO;
    }else
    {
        cell.nameLabel.text = m.name;
        cell.nameLabel.textColor = RGBA(143, 143, 143, 1);
        cell.selectView.hidden = YES;
        cell.contentView.backgroundColor = RGBA(249, 249, 249, 1);
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 102 * kScreenWidth;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    select = indexPath.row;
    
    AllgoodModel *model = _dataClassArray[indexPath.row];
    NSLog(@"%ld",[model.cateid integerValue]);
    [self loadId:model.cateid];
    [self.buyGoodThingView.listTableView reloadData];
    [self.buyGoodThingView.showCollectionView reloadData];
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    //    ButGoodModel *b = _dataArray[indexPath.row];
    //    cell.layer.borderWidth = 0.5;
    //    cell.layer.borderColor = RGBA(143, 143, 143, 1).CGColor;
    //    NSString *url = [NSString stringWithFormat:@"http://192.168.1.121:8099%@",b.SmallImageUrl];
   
   AllgoodModel * gmodel = _dataArray[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    cell.title.text = [NSString stringWithFormat:@"%@",gmodel.title];
    cell.total.text =[NSString stringWithFormat:@"总量 %@ 剩余 %@",gmodel.total,gmodel.remain ];
    cell.valueLb.text = [NSString stringWithFormat:@"价值: %@",gmodel.money];
    cell.buttonSubtract .tag = indexPath.row;
    cell.buttonAdd .tag = indexPath.item ;
    cell.quantity.text =self.rowArr[indexPath.row];
    [cell.buttonAdd addTarget:self action:@selector(jiahao:) forControlEvents:UIControlEventTouchUpInside];
    [cell.buttonSubtract addTarget:self action:@selector(jianhao:) forControlEvents:UIControlEventTouchUpInside];
//    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:gmodel.] placeholderImage:[UIImage imageNamed:@"占位图方"]];

    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(TOKEN != nil)
    {
    AllgoodModel *b = _dataArray[indexPath.item];
        index = indexPath.item;
    ShopViewViewController *shopDetail = [ShopViewViewController new];
    shopDetail.sId = b.ID;
        NSLog(@"%@",b.ID);
    [self.navigationController pushViewController:shopDetail animated:YES];
    }else
    {
        [self.navigationController pushViewController:[LoginViewController new] animated:YES];
    }
}
-(void)jiahao:(UIButton *)jia
{
    int b = [[self.rowArr objectAtIndex:jia.tag ] intValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag  withObject:[NSString stringWithFormat:@"%d",b ]];
    AllgoodModel  *m = _dataArray [jia.tag] ;
    NSLog(@"%@ %d",m.ID,[m.ID intValue]);
    NSLog(@"%@ %d",TOKEN,b);
    
    NSLog(@"%@ %d",[NSString stringWithFormat:@"%@",TOKEN], [TOKEN intValue]);
    [Address pushLoginWithBlock:^{
       
        [AllgoodModel setWithSId:[m.ID intValue] Withnum:b WithUId:TOKEN  WithBlock:^(id returnValue) {
             [self.buyGoodThingView.showCollectionView reloadData];
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"已添加购物车" AndViewController:self];
            
        }];

    }];

    
}
//减号方法
-(void)jianhao:(UIButton *)jian
{ int b = [[self.rowArr objectAtIndex:jian.tag ] intValue];
    
    if(b> 0)
    {
        b--;
        [self.rowArr replaceObjectAtIndex:jian.tag  withObject:[NSString stringWithFormat:@"%d",b ]];
        
        [self.buyGoodThingView.showCollectionView reloadData];
        AllgoodModel  *m = _dataArray [jian.tag] ;

        [AllgoodModel setWithSId:[m.ID intValue] Withnum:0 WithUId:TOKEN  WithBlock:^(id returnValue) {
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"已添加购物车" AndViewController:self];
            
        }];
    }
}
-(void)creatNavi
{
    UIView *naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    naviView.backgroundColor = kAppColor;
    [self.view addSubview:naviView];
    UIButton *leftImg =[ UIButton buttonWithType:UIButtonTypeCustom];
    leftImg.frame =CGRectMake(20, 20+12, 10, 20);
    [leftImg setImage:[UIImage imageNamed:@"返回"] forState:0] ;
    [leftImg addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [naviView addSubview:leftImg];
    UIButton *btn =[ UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"购物车1@2x"] forState:0];
    [naviView addSubview:btn];
    btn.frame = CGRectMake(630*kScreenWidth, 32, 72 *kScreenWidth, 52*kScreenHeight);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    // 初始化
    //    UIButton *titleView = [[UIButton alloc] initWithFrame:CGRectMake( leftImg.right  +40*kScreenWidth, 45*kScreenHeight , 524* kScreenWidth , 59* kScreenHeight )];
    //    // 点击事件
    //    [titleView addTarget:self action:@selector(clickOnTitleView) forControlEvents:UIControlEventTouchUpInside];
    //    // 设置为titleView
    //    [naviView addSubview:titleView];
    //    titleView.backgroundColor =[ UIColor whiteColor];
    //    [titleView setImage:[UIImage imageNamed:@"搜索"] forState:0];
    //    search = [[SearchView alloc]initWithFrame:CGRectMake( leftImg.right  +50*kScreenWidth, 32 , 500* kScreenWidth , 59* kScreenHeight)];
    //    search.delegate = self;
    //    search.layer.cornerRadius = 5;
    //    search.clipsToBounds = YES;
    //    [naviView addSubview:search];
    
    UIButton *searchBtn =[ UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(leftImg.right  +50*kScreenWidth, 28, 500* kScreenWidth , 59* kScreenHeight);
    [naviView addSubview:searchBtn];
    [searchBtn setImage:[UIImage imageNamed:@"搜索"] forState:0];
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.layer.cornerRadius = 5.0f;
    searchBtn.layer.masksToBounds =YES;
    
}
//-(BOOL)textFieldShouldClear:(UITextField *)textField
//{
//    self.searchTableView.hidden = YES;
//    return YES;
//}
//
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    self.searchTableView.hidden = NO;
//
//
//    return YES;
//
//}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
//{
//    NSLog(@"%@",search.text);
//    return YES;
//}

- (void)search:(UIButton *)btn
{
    SearchViewController *sear =[[ SearchViewController alloc] init];
    [self.navigationController pushViewController:sear animated:YES];
    NSLog(@"搜索");
    
}
-(void)btnClick

{
    ShopCarViewController *car =[[ ShopCarViewController alloc] initWithNibName:@"ShopCarViewController" bundle:nil];
    [self.navigationController pushViewController:car animated:YES];
    
}

-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
//-(void)CreatsearchTableView
//{
//    self.searchTableView =[[ UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_WIDTH, Screen_HEIGHT) style:UITableViewStylePlain];
//    [self.view addSubview:_searchTableView];
//    _searchTableView.delegate = self;
//    _searchTableView.dataSource =self;
//    [_searchTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"searchcell"];
//}
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
