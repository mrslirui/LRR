//
//  DuobaoCollectionViewCell.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/26.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "DuobaoCollectionViewCell.h"
#import "DoingTableViewCell.h"
#import "WillDoTableViewCell.h"
#import "DoneTableViewCell.h"
#import "DuobaoModel.h"

@interface DuobaoCollectionViewCell ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,retain)NSMutableArray *dataArr;
@end
@implementation DuobaoCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if (self) {
        [self  creatView];
        self.backgroundColor = kHexColor(0xeeeeee);
        self.dataArr = [NSMutableArray array];
       }
    return self;
}

-(void)loadDataWithTYPE:(int)t
{
       [DuobaoModel setWithType:t WithToken:TOKEN WithBlock:^(id value) {
           self.dataArr = value;
           [self.tableView reloadData];
    }];
}
-(void)creatView
{
    self.tableView = [[ UITableView alloc] initWithFrame:CGRectMake(0, 1, Screen_WIDTH, Screen_HEIGHT ) style:UITableViewStylePlain];
    [self addSubview:_tableView];
    _tableView.backgroundColor =kHexColor(0xeeeeee);
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 120, 0);
    [_tableView registerClass:[DoingTableViewCell class] forCellReuseIdentifier:@"cell"];
    [_tableView registerClass:[WillDoTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [_tableView registerClass:[DoneTableViewCell class] forCellReuseIdentifier:@"cell2"];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.separatorColor =kHexColor(0xeeeeee);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.type == 1) {
        return _dataArr.count;
    }
    return _dataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(self.type == 1)
    {
    DoingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        DuobaoModel *dm =_dataArr[indexPath.row];
    cell.titleLabel.text = dm.title;
        cell.progressStr =[NSString stringWithFormat:@"总需%@人 剩余%d人",dm.zongrenshu,[dm.zongrenshu intValue] - [dm.canyurenshu intValue]];
        CGFloat f = [dm.canyurenshu floatValue] / [dm.zongrenshu floatValue];
        cell.pro  = f ;
        
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:dm.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];

        return cell;

    }
//     else if(self.type == 1)
//    {
//        WillDoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
//        cell.titleLabel.text = @"(第26期)2016猴年大吉高端贺岁";
//        cell.progressView.backgroundColor = [UIColor lightGrayColor];
//        //set方法
//        cell.progressStr =@"揭晓倒计时:03:26:33";
//        cell.pro  = 1;
//        cell.valueLabel.text = @"价值: 99.00";
//        return cell;
//
//    }
    else
    {
        
    DoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        
        DuobaoModel *dm =_dataArr[indexPath.row];
        cell.titleLabel.text = dm.title;
        cell.valueLabel.text = [NSString stringWithFormat:@"价值: %@",dm.money ];
        
        cell.people.text = dm.mobile;
        cell.time.text = [NSString stringWithFormat:@"揭晓时间: %@",[XLMethod changeTime:[dm.q_end_time floatValue]  formatter:@"YYYY-MM-dd HH:mm"]];
        [cell.imgView sd_setImageWithURL:[NSURL URLWithString:dm.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];

        if ([dm.mobile isEqualToString:[[NSUserDefaults standardUserDefaults] objectForKey:@"login"][@"username"]] ) {
            cell.people.text =@"已获奖";
            cell.people.textColor = kHexColor(0xff5333);
        }
            return cell;
    
    }
  }
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 165*kScreenHeight;
}
-(void)setType:(int)type
{_type = type;
    [self loadDataWithTYPE:_type];
}
@end
