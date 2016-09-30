
//
//  HelpViewController.m
//  PMSC
//
//  Created by 李锐 on 16/8/23.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "HelpViewController.h"
#import "HelpView.h"
#import "QuestionViewController.h"
#import "QuestionDetailViewController.h"
#import "HelpCollectionViewCell.h"
#import "HelpModel.h"
@interface HelpViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,TopScViewOriginDelegate>
@property(nonatomic,retain)HelpView *helpView;
@property(nonatomic,retain)NSMutableArray *hotArr;
@property(nonatomic,retain)NSMutableArray *myArr;
@end

@implementation HelpViewController

-(HelpView *)helpView
{
    if (!_helpView) {
        _helpView = [[HelpView alloc] initWithFrame:self.view.bounds];
    }
    return _helpView;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"帮助";
    [self.view addSubview:self.helpView];
    _helpView.collectionView.dataSource = self;
    _helpView.collectionView.delegate = self;
    [_helpView.collectionView registerClass:[HelpCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [_helpView.collectionView registerClass:[HelpCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    self.helpView.top.delegate = self;
    self.hotArr = [NSMutableArray array];
    self.myArr = [NSMutableArray array];
    
   
   }
-(void)loadData
{
    
        [HelpModel setWithType:1 withuserId:TOKEN   withBlock:^(id value) {
            self.myArr = value;
            
            [self.helpView.collectionView reloadData];
        }];
        
        [HelpModel setWithType:2 withuserId:TOKEN  withBlock:^(id value) {
            self.hotArr = value;
            
            
        }];

    
   
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        HelpCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        cell.type = 0;
        cell.mArr = self.myArr;
        [cell.tiwenBtn addTarget:self action:@selector(tiwen) forControlEvents:UIControlEventTouchUpInside];
        cell.Qblock = ^(NSString *index)
        {
    QuestionDetailViewController *question =[[ QuestionDetailViewController alloc] init];
            question.qId = index;
    [self.navigationController pushViewController:question animated:YES];
        
        };
        return cell;
    }
    else
    {
        HelpCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
        cell.type =  1;
        cell.hArr = self.hotArr;
        [cell.tiwenBtn addTarget:self action:@selector(tiwen) forControlEvents:UIControlEventTouchUpInside];
        cell.Qblock = ^(NSString *index)
        {
            QuestionDetailViewController *question =[[ QuestionDetailViewController alloc] init];
            question.qId = index;
            
            [self.navigationController pushViewController:question animated:YES];
            
        };

        return cell;
        
    }
    
}

- (void)PassOriginWithX:(CGFloat)x
{
    [_helpView.collectionView setContentOffset:CGPointMake(x, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f", scrollView.contentOffset.x);
    // 把collectionView的位移传入TopScView中
    if([UIScreen mainScreen].bounds.size.width != 320)
    {
        [self.helpView.top changeContentOffsetWithH:(_helpView.collectionView.contentOffset.x + 82 )]
        ;
    }
    else{
        [self.helpView.top changeContentOffsetWithH:(_helpView.collectionView.contentOffset.x + 75 )];
        
    }
    
}


-(void)tiwen
{
    [self.navigationController pushViewController:[QuestionViewController new] animated:YES];
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
