//
//  SearchViewController.m
//  PMSC
//
//  Created by 李锐 on 16/9/8.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "SearchViewController.h"
#import "UIImage+ImageCompress.h"
#import "SKTagView.h"
#import "SearchBarView.h"
#import "SearchDetailViewController.h"
#import "SearchModel.h"
@interface SearchViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) NSMutableArray *dataSource;

@property(nonatomic,retain)UISearchBar *searchBar;
@property(nonatomic,retain)SearchBarView *sView;

@end

@implementation SearchViewController

-(SearchBarView *)sView
{
    if (!_sView) {
        _sView = [[SearchBarView alloc] initWithFrame:self.view.bounds];
    }
    return _sView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.sView];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, 44)];
    titleView.backgroundColor = [UIColor clearColor];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 600*kScreenWidth, 44)];
    self.searchBar.delegate = self;
    self.searchBar.placeholder = @"请输入要搜索的文字";
    self.searchBar.showsCancelButton = YES;
    // 键盘确认按钮的名字
    self.searchBar.returnKeyType = UIReturnKeySearch;
    // 把默认灰色背景浮层给去掉
    self.searchBar.backgroundColor = [UIColor clearColor];
    self.searchBar.backgroundImage = [UIImage new];
    UITextField *searBarTextField = [self.searchBar valueForKey:@"_searchField"];
    if (searBarTextField)
    {
        [searBarTextField setBackgroundColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1]];
        searBarTextField.borderStyle = UITextBorderStyleRoundedRect;
        searBarTextField.layer.cornerRadius = 5.0f;
    }
    else
    {
        // 通过颜色画一个Image出来
        UIImage *image = [UIImage imageWithColor:[UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1] forSize:CGSizeMake(28, 28)];
        [self.searchBar setSearchFieldBackgroundImage:image forState:UIControlStateNormal];
    }
    [titleView addSubview:self.searchBar];
    self.navigationItem.titleView = titleView;
    [self.searchBar becomeFirstResponder];
    self.sView.dataArr = [[NSUserDefaults  standardUserDefaults] objectForKey:@"myArray"];
    self.sView.dataArr1 = self.dataSource;
    // 点击事件回调历史搜索
    self.sView.tagView.didTapTagAtIndex = ^(NSUInteger idx){
        
        NSLog(@"点击了第%ld个",idx);
        
    };
 //热门搜索
    self.sView.tagView1.didTapTagAtIndex = ^(NSUInteger idx){
        
        NSLog(@"点击了第%ld个",idx);
        
    };
    

   }



- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    return YES;
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.searchBar resignFirstResponder];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%@",searchBar.text);
    //历史记录方法
//    [self SearchText:searchBar.text];
     [self.searchBar resignFirstResponder];
    SearchDetailViewController *sd = [SearchDetailViewController new];
    
    sd.searchText = searchBar.text;
    [self.navigationController pushViewController:sd animated:YES];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
   
    if (searchText.length == 0) {
        // 没有文字了
        self.sView.label.hidden = NO;
        self.sView .tagView.hidden = NO;
        self.sView.label1.hidden = NO;
        self.sView .tagView1.hidden = NO;

    }
    else
    {
        self.sView.label.hidden = YES;
        self.sView.tagView.hidden = YES;
        self.sView.label1.hidden = YES;
        self.sView.tagView1.hidden = YES;
        
    }
}
-(void)SearchText :(NSString *)seaTxt
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [[NSArray alloc] initWithArray:[userDefaultes arrayForKey:@"myArray"]];
    
    // NSArray --> NSMutableArray
   NSMutableArray * searTXT = [myArray mutableCopy];
    
    BOOL isEqualTo1,isEqualTo2;
    isEqualTo1 = NO,isEqualTo2 = NO;
    
    if (searTXT.count > 0) {
        isEqualTo2 = YES;
        //判断搜索内容是否存在，存在的话放到数组最后一位，不存在的话添加。
        for (NSString * str in myArray) {
            if ([seaTxt isEqualToString:str]) {
                //获取指定对象的索引
                NSUInteger index = [myArray indexOfObject:seaTxt];
                [searTXT removeObjectAtIndex:index];
                [searTXT addObject:seaTxt];
                isEqualTo1 = YES;
                break;
            }
        }
    }
    
    if (!isEqualTo1 || !isEqualTo2) {
        [searTXT addObject:seaTxt];
    }
    
    if(searTXT.count > 15)
    {
        [searTXT removeObjectAtIndex:0];
    }
    //将上述数据全部存储到NSUserDefaults中
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:searTXT forKey:@"myArray"];
}

-(NSMutableArray *)dataSource
{
    if (_dataSource == nil) {
        _dataSource = [[NSMutableArray alloc] initWithArray:@[@"余罪",@"恐怖游轮",@"放牛班的春天",@"当幸福来敲门",@"哈利波特",@"死亡密码",@"源代码",@"盗梦空间",@"疯狂动物城",@"X战警",@"西游降魔篇",@"这个男人来自地球",@"致命ID致命ID致命ID致命ID",@"搏击俱乐部",@"冰雪世界"]];
    }
    return _dataSource;
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
