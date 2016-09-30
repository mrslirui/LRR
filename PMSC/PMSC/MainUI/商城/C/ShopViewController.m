//
//  ShopViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ShopViewController.h"
#import "ShopView.h"
#import "HeadCollectionReusableView.h"
#import "ShopCollectionViewCell.h"
#import "AllgoodsViewController.h"
#import "ShopViewViewController.h"
#import "ShopCarViewController.h"
#import "NewJiexiaoViewController.h"
#import "SearchView.h"
#import "ChangeViewController.h"
#import "ShareShaidanViewController.h"
#import "SKTagView.h"
#import "SearchViewController.h"
#import "shopModel.h"
#import "LoginViewController.h"

@interface ShopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UITextFieldDelegate>
{
    SearchView  *search;
}
@property(nonatomic,retain)ShopView *shopView;
@property(nonatomic,retain)NSMutableArray *dataArr;/*** 数据请求数组 */
@property(nonatomic,retain)NSMutableArray *rowArr; /*** 加减号数组 */
@property(nonatomic,retain)UIView *bView;
@property(nonatomic,retain)UITableView *searchTableView;
@property(nonatomic,retain)UIView *effect; //毛玻璃
@property (nonatomic,strong) SKTagView *tagView;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UILabel *label;
@property(nonatomic,retain)HeadCollectionReusableView *header;


@end

@implementation ShopViewController
-(NSMutableArray *)dataSource
{
    if(!_dataSource)
    {
        self.dataSource = [NSMutableArray array];
        self.dataSource = [@[@"全部",@"一元",@"特惠",@"限购",@"极速"] mutableCopy];

    }
    return _dataSource;
}
-(NSMutableArray *)dataArr
{
    if(!_dataArr)
    {
        self.dataArr = [NSMutableArray array];
        
    }
    return _dataArr;
    
}
-(NSMutableArray *)rowArr
{
    if(!_rowArr)
    {
        self.rowArr = [NSMutableArray array];
            }
    return _rowArr;
}
-(ShopView *)shopView
{
    if (!_shopView) {
        self.shopView = [[ShopView alloc] initWithFrame:self.view.bounds];
        self.shopView.collectionView .delegate = self;
        self.shopView.collectionView.dataSource = self;
    }
    return _shopView;
}
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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.shopView];
    [self.shopView.collectionView registerClass:[ShopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self creatNavi];
    [_shopView.collectionView registerClass: [HeadCollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader  withReuseIdentifier:@"header"];
    [self bottom];

    self.bView.hidden = YES;
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(bottomisHiden) name:@"底部视图是否隐藏" object:nil];
    __weak typeof (ShopViewController) *weakself = self;
    [shopModel setBLockwithblock:^(id returnValue) {
        NSArray *arr = returnValue[@"xplb"];
        for (NSDictionary *dic in arr) {
        [self.dataArr addObject:[shopModel getDic:[XLMethod changeDicForkey:dic]]];
        
        }

        
        NSArray *arr1 = returnValue[@"zxhjxx"];
        weakself.header.gbArr = [shopModel modelHanderWithArray:arr1];
        NSLog(@"%@",arr);
        
        for (int i = 0; i< _dataArr.count; i++) {
            [self.rowArr addObject:@"0"];
        }
            [_shopView.collectionView reloadData];
        
    }];
    

}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
    {
        return _dataArr.count;
    }
    
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
    {
        
        ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];

         shopModel *model = _dataArr[indexPath.row];
       cell.title.text = [NSString stringWithFormat:@"(第%@期)%@",model.qishu,model.title];
        cell.total.text = [NSString stringWithFormat:@"总量:%@ 剩余: %@",model.canyurenshu,model.shenyurenshu];
        cell.valueLb.text = [NSString stringWithFormat:@"价值:%@",model.money];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://gangmaduobao.com/?/%@",model.thumb]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
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
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
    {
        //通过kind类型判断 设置相应内容
        //从重用池获取头部视图
        self.header =[ collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        [self.header.arrow addTarget:self action:@selector(rightArrow:) forControlEvents:UIControlEventTouchUpInside];
        __weak typeof (ShopViewController) *weakself = self;
        self.header.click = ^(NSInteger index)
        { 
           
           

            if(index == 1 || (index == 4) ||(index == 5 )|| (index == 6))
            {
                AllgoodsViewController *all =[ AllgoodsViewController new];
//                all.secStr = self.dataSource[3];
                [weakself.navigationController pushViewController:all animated:YES];
            }
            //开奖
            else if(index == 0)
            {
                [weakself.navigationController pushViewController:[NewJiexiaoViewController new] animated:YES];
            }
            //积分转换
            else if (index == 3)
            {
                [weakself.navigationController pushViewController:[ChangeViewController new] animated:YES];
            }
            //晒单分享
            else if(index == 2)
            {
               
                    ShareShaidanViewController *shaidan =[[ ShareShaidanViewController alloc] initWithNibName:@"ShareShaidanViewController" bundle:nil];
                    
                    [weakself.navigationController pushViewController:shaidan animated:YES];

                }

              
               };
        //轮播图点击
        self.header.click1 = ^(NSInteger index)
        {
             NSLog(@"点击第%ld个图片",index);
        };
        return self.header;
        
        
    }
    
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
    {
        [_shopView.collectionView deselectItemAtIndexPath:indexPath animated:YES];
        NSLog(@"点击");
        if (TOKEN == nil) {
            [self.navigationController pushViewController:[LoginViewController new] animated:YES];

        }else{
        ShopViewViewController *shop = [ShopViewViewController new];
        shopModel *model = _dataArr[indexPath.item];
         shop.sId =model.ID;
        [self.navigationController pushViewController:shop animated:YES];
          }
    }
-(void)rightArrow:(UIButton *)sender
{
    NSLog(@"热门跳页");
}
//监听
-(void)bottomisHiden
{
    self.bView.hidden = NO;
    
}
//加号方法
-(void)jiahao:(UIButton *)jia
{
    NSInteger b = [[self.rowArr objectAtIndex:jia.tag - 10000] integerValue];
    b++;
    [self.rowArr replaceObjectAtIndex:jia.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
    [self.shopView.collectionView reloadData];
//    self .bView.hidden = NO;

}
//减号方法
-(void)jianhao:(UIButton *)jian
{ NSInteger b = [[self.rowArr objectAtIndex:jian.tag - 10000] integerValue];
   
    if(b> 0)
    {
        b--;
    [self.rowArr replaceObjectAtIndex:jian.tag - 10000 withObject:[NSString stringWithFormat:@"%ld",b ]];
   
    [self.shopView.collectionView reloadData];

    }

//    self.bView.hidden = YES;
}
-(void)creatNavi
{
    UIView *naviView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 64)];
    naviView.backgroundColor = kAppColor;
    [self.view addSubview:naviView];
    UIImageView *leftImg =[[ UIImageView alloc] initWithFrame:CGRectMake(0, 29, 140*kScreenWidth, 54*kScreenWidth)];
    leftImg.image = [UIImage imageNamed:@"首页图标"];
//    leftImg.backgroundColor = [UIColor whiteColor];
    [naviView addSubview:leftImg];
    UIButton *btn =[ UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"购物车1@2x"] forState:0];
    [naviView addSubview:btn];
    btn.frame = CGRectMake(630*kScreenWidth, 32, 72 *kScreenWidth, 52*kScreenHeight);
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//     search = [[SearchView alloc]initWithFrame:CGRectMake( leftImg.right  +20*kScreenWidth, 45*kScreenHeight , 457* kScreenWidth , 59* kScreenHeight)];
//       search.delegate = self;
//        search.layer.cornerRadius = 5;
//         search.clipsToBounds = YES;
//        [naviView addSubview:search];
//    [search addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
    UIButton *searchBtn =[ UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(leftImg.right  +20*kScreenWidth, 28, 457* kScreenWidth , 59* kScreenHeight);
    [naviView addSubview:searchBtn];
    [searchBtn setImage:[UIImage imageNamed:@"搜索"] forState:0];
    [searchBtn addTarget:self action:@selector(search:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.layer.cornerRadius = 5.0f;
    searchBtn.layer.masksToBounds =YES;
 }
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
//{
//    if ([keyPath isEqualToString:@"text"]) {
//        if (search.text.length == 0) {
//            self.searchTableView.hidden = YES;
//        }else
//        {
//
//        }
//    }
//}
//-(void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    self.effect =[[UIView alloc] initWithFrame:CGRectMake(0, 64, Screen_WIDTH, Screen_HEIGHT)];
//    [self.view addSubview:_effect];
//    self.effect.backgroundColor = [UIColor whiteColor];
//}
//-(void)textFieldDidEndEditing:(UITextField *)textField
//{
//    [self.tagView removeFromSuperview];
//
//    [self.effect removeFromSuperview];
//}
//-(BOOL)textFieldShouldClear:(UITextField *)textField
//{
//    self.label.hidden = NO;
//    self.tagView.hidden = NO;
//    return YES;
//}
//
//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//
//    
//        self.label.hidden = YES;
//        self.tagView.hidden = YES;
// 
//
//    return YES;
//
//}
//- (BOOL)textFieldShouldReturn:(UITextField *)textField
// {
//        NSLog(@"%@",search.text);
//     [self .navigationController pushViewController:[SearchViewController new] animated:YES];
//       return YES;
//  }
//搜索
-(void)search:(UIButton *)btn
{
    [self .navigationController pushViewController:[SearchViewController new] animated:YES];
}
//购物车
-(void)btnClick

{
    ShopCarViewController *car =[[ ShopCarViewController alloc] initWithNibName:@"ShopCarViewController" bundle:nil];

    [self.navigationController pushViewController:car animated:YES];
    
}
//底部视图
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
//-(void)CreatsearchTableView
//{
//    self.searchTableView =[[ UITableView alloc] initWithFrame:CGRectMake(0, 64, Screen_WIDTH, Screen_HEIGHT) style:UITableViewStylePlain];
//    [self.view addSubview:_searchTableView];
//    _searchTableView.delegate = self;
//    _searchTableView.dataSource =self;
//    [_searchTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 5;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
//    cell.textLabel.text = @"搜索";
//    return cell;
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
