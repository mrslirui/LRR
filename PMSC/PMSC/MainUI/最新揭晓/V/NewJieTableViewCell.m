//
//  NewJieTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "NewJieTableViewCell.h"
#import "NewCollectionViewCell.h"
#import "NewJiexiaoModel.h"

@interface NewJieTableViewCell ()
@property(nonatomic,retain)NSMutableArray *dataArr;
@end
@implementation NewJieTableViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self load];
        [self loadData];
    }
    return self;
}
-(void)load

{
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(358*kScreenWidth, 420 *kScreenHeight);
    flow.minimumLineSpacing = 1;
    flow.minimumInteritemSpacing = 1;
    flow.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0 *kScreenHeight, self.frame.size.width, self.frame.size.height-64) collectionViewLayout:flow];
    _collectionView.backgroundColor = kHexColor(0xeeeeee);
    [self addSubview:_collectionView];
    _collectionView.dataSource =self;
    _collectionView.delegate = self;
    [_collectionView registerClass:[NewCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    _collectionView.bounces = NO;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _dataArr.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NewCollectionViewCell *cell =[ collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    NewJiexiaoModel *m = _dataArr[indexPath.row];
    cell.title.text = m.shopname;
    cell.getPeople.text =[NSString stringWithFormat:@"获奖者:%@",m.username];
    cell.luckCode.text = [ NSString stringWithFormat:@"幸运号码: %@",m.q_user_code];
    cell.time.text = [NSString stringWithFormat:@"揭晓时间:%@", [XLMethod changeTime:[m.q_end_time floatValue] formatter:@"YYYY-MM-dd"]];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:m.thumb] placeholderImage:[UIImage imageNamed:@"占位图方"]];
                      return cell;
}
-(void)loadData
{ [NewJiexiaoModel setWithtype:2 Withpage:0 WithBlock:^(id value) {
       
    self.dataArr = [NewJiexiaoModel modelHanderWithArray:value[@"data"]];
  
    [self.collectionView reloadData];
    
    
    
    
}];
    
}


@end
