//
//  ReplyDetailViewController.m
//  PMSC
//
//  Created by 杨晓龙 on 16/8/27.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "ReplyDetailViewController.h"
#import "ReplyDetailsModel.h"
#import "ReplyMessageModel.h"
#import "ReplyDetailTableViewCell.h"
#import "YMReplyInputView.h"
#import "tableViewHeader.h"
@interface ReplyDetailViewController ()<UITableViewDataSource,UITableViewDelegate,InputDelegate>
{
    YMReplyInputView * replyView;
}
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *modelsArray;
@property (nonatomic, strong) tableViewHeader *t;
@end

@implementation ReplyDetailViewController
- (NSMutableArray *)modelsArray
{
    if (!_modelsArray) {
        self.modelsArray = [NSMutableArray array];
    }
    return _modelsArray;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    [self loadData];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"详情";
    // Do any additional setup after loading the view.
   
    self.t = [[tableViewHeader alloc] initWithFrame:CGRectZero];
    self.view.backgroundColor = kHexColor(0xeeeeee);
//    [self creatModelsWithCount:10];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0 * kScreenWidth, self.view.frame.size.width, CGRectGetHeight(self.view.frame) - 20 * kScreenWidth) style:UITableViewStylePlain];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.t.rewardButton addTarget:self action:@selector(rewardButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.tableView.tableHeaderView = _t;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.t.voteButton addGestureRecognizer:tap];
    
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    
    [self.tableView registerClass:[ReplyDetailTableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:_tableView];
    self.t.sd_layout
    .topSpaceToView(self.view,20 * kScreenWidth)
    .leftSpaceToView(self.view,0)
    .widthIs([UIScreen mainScreen].bounds.size.width)
    .heightIs(500);
    
    
    
}
- (void)loadData
{
    [ReplyDetailsModel setReplyDetails:TOKEN ID:self.ID block:^(id value, id message) {
        ReplyDetailsModel *re = value;
        self.t.titleLabel.text = re.title;
        self.t.nameLabel.text = [NSString stringWithFormat:@"%@ %@",re.author,[XLMethod mofangWeChat:re.time formatter:@"yyyy-MM-dd HH:mm"]];
        
        [self.t.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://%@",re.img]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
        
        self.t.contentString = re.content;
        self.t.voteButton.label.text = [NSString stringWithFormat:@"%d",re.total];
        if (re.reward == 0) {
            [self.t.rewardButton setBackgroundImage:[UIImage imageNamed:@"赏@3x_1"] forState:UIControlStateNormal];
        }else
        {
            [self.t.rewardButton setBackgroundImage:[UIImage imageNamed:@"赏@3x"] forState:UIControlStateNormal];
        }
        __weak typeof(self) weakSelf = self;
        self.t.didFinishAutoLayoutBlock = ^(CGRect frame) {
            weakSelf.tableView.tableHeaderView = weakSelf.t;
        };
        
        [self.modelsArray addObjectsFromArray:message];
        [self.tableView reloadData];
    }];
}

#pragma 赏
- (void)rewardButtonAction:(UIButton *)sender
{
    NSLog(@"赏");
}
#pragma 评论
- (void)tapAction:(UITapGestureRecognizer *)sender
{
    NSLog(@"评论");
    replyView = [[YMReplyInputView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width,44) andAboveView:self.view];
    replyView.delegate = self;
    //    replyView.replyTag = sender.tag;
    [self.view addSubview:replyView];
}
- (void)YMReplyInputWithReply:(NSString *)replyText appendTag:(NSInteger)inputTag
{
//    NSLog(@"%@",replyText);
//    ReplyDetailsModel *model = [[ReplyDetailsModel alloc] init];
//    model.name = @"张小凡";
//    model.content = [NSString stringWithFormat:@"张小凡：%@",replyText];
//    [self.modelsArray addObject:model];
//    [self.tableView reloadData];
}
- (void)destorySelf
{
    [replyView removeFromSuperview];
    replyView = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _modelsArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReplyDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.model = self.modelsArray[indexPath.row];
    
    
    
    //    cell.nickNameLabel.dele = self;
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:tableView];
    
    ///////////////////////////////////////////////////////////////////////
    
    return cell;

}
- (void)didSelectText:(NSString *)text
{
//    XLViewController *xl = [XLViewController new];
//    xl.ID = text;
//    [self presentViewController:xl animated:YES completion:nil];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ReplyMessageModel *demo = _modelsArray[indexPath.row];
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@回复%@：%@",demo.name,demo.pname,demo.con]];
    
    
    return [ReplyDetailTableViewCell heightWithText:attributedString];
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
