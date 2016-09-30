//
//  StoreBaskTableViewCell.m
//  PMSC
//
//  Created by 杨晓龙 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "StoreBaskTableViewCell.h"
#import "StoreBaskCollectionViewCell.h"
@interface StoreBaskTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *jianImgView;
@property (nonatomic, strong) UICollectionView *collectView;
@end

@implementation StoreBaskTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self load];
    }
    return self;
}
- (void)load
{
    self.backgroundColor = kHexColor(0xeeeeee);
    self.headImgView = [UIImageView new];
    self.headImgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_headImgView];
    
    self.nameLabel = [UILabel new];
    self.nameLabel.text = @"保佑中个苹果手机";
    self.nameLabel.textColor = kHexColor(0x032543);
    self.nameLabel.font = [UIFont systemFontOfSize:28 * kScreenWidth];
    [self.contentView addSubview:_nameLabel];
    self.bgView = [UIView new];
    self.bgView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:_bgView];
    
    self.jianImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sd_jiantou"]];
    [self.contentView addSubview:_jianImgView];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.text = @"中奖啦";
    self.titleLabel.textColor = kHexColor(0x313131);
    self.titleLabel.font = [UIFont systemFontOfSize:30 * kScreenWidth];
    [self.bgView addSubview:_titleLabel];
    
    self.contentLabel = [UILabel new];
    self.contentLabel.numberOfLines = 2;
    self.contentLabel.font = [UIFont systemFontOfSize:24 * kScreenWidth];
    self.contentLabel.textColor = kHexColor(0x999999);
    [self.bgView addSubview:self.contentLabel];
    
    self.dateLabel = [UILabel new];
    self.dateLabel.font = [UIFont systemFontOfSize:22 * kScreenWidth];
    self.dateLabel.textColor = kHexColor(0x999999);
    self.dateLabel.text = @"07月26日 12:50";
    self.dateLabel.textAlignment = NSTextAlignmentRight;
    [self.bgView addSubview:_dateLabel];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    flow.itemSize = CGSizeMake(167 * kScreenWidth, 113 * kScreenWidth);
    flow.minimumInteritemSpacing = 7 * kScreenWidth;
    flow.minimumLineSpacing = 7 * kScreenWidth;
    
    self.collectView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    self.collectView.dataSource = self;
    self.collectView.delegate = self;
    self.collectView.userInteractionEnabled = NO;
    self.collectView.backgroundColor = [UIColor whiteColor];
    [self.collectView registerClass:[StoreBaskCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
    [self.bgView addSubview:self.collectView];
    _headImgView.layer.cornerRadius = _headImgView.width /2;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.headImgView.frame = CGRectMake(20 * kScreenWidth, 24 * kScreenWidth, 84 * kScreenWidth, 84 * kScreenWidth);
    _headImgView.layer.cornerRadius = _headImgView.width /2;
    
    self.nameLabel.frame = CGRectMake(CGRectGetMaxX(self.headImgView.frame) + 26 * kScreenWidth, 28 * kScreenWidth, CGRectGetWidth(self.contentView.frame) - 150 * kScreenWidth, 28 * kScreenWidth);
    CGFloat f = [[self class] heightWithText:self.contentLabel.text];
    CGFloat imgHei = [[self class] imgHeight:_imgArray];
    self.jianImgView.frame = CGRectMake(116 * kScreenWidth, CGRectGetMaxY(self.nameLabel.frame) + 22 * kScreenWidth, 14 * kScreenWidth, 17 * kScreenWidth);
    self.bgView.frame = CGRectMake(130 * kScreenWidth, CGRectGetMaxY(self.nameLabel.frame) + 14 * kScreenWidth, 570 * kScreenWidth , 121 * kScreenWidth + f + imgHei);
    self.titleLabel.frame = CGRectMake(20 * kScreenWidth, 15 * kScreenWidth, CGRectGetWidth(self.bgView.frame) - 40 * kScreenWidth, 30 * kScreenWidth);
    self.contentLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.titleLabel.frame) + 13 * kScreenWidth, CGRectGetWidth(self.titleLabel.frame), f);
    self.collectView.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.contentLabel.frame) + 12 * kScreenWidth, 530 * kScreenWidth, imgHei);
    self.dateLabel.frame = CGRectMake(CGRectGetMinX(self.titleLabel.frame), CGRectGetMaxY(self.contentLabel.frame) + 28 * kScreenWidth + imgHei, CGRectGetWidth(self.titleLabel.frame), 20 * kScreenWidth);
    
}
- (void)setImgArray:(NSArray *)imgArray
{
    _imgArray = imgArray;
    [self.collectView reloadData];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _imgArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    StoreBaskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:self.imgArray[indexPath.item]] placeholderImage:[UIImage imageNamed:@"占位图方"]];
    return cell;
}

- (float)randomFloatBetween:(float)num1 andLargerFloat:(float)num2
{
    
    float diff = num1 - num2;
    float a = num1 - (((float) rand() / RAND_MAX) * diff);
    
    return a;
}
+ (CGFloat)imgHeight:(NSArray *)imgArray
{
    CGFloat height = 0;
    if (imgArray.count == 0) {
        
    }else
    {
        if (imgArray.count <= 3) {
            height = 113* kScreenWidth;
        }else if (imgArray.count > 3 && imgArray.count <= 6) {
            height = 113 * kScreenWidth * 2 + 7 * kScreenWidth;
        }else
        {
            height = 113 * kScreenWidth * 3 + 7 * 2 * kScreenWidth;
        }
    }
    
    return height;
}
+(CGFloat)heightWithText:(NSString *)text
{
    //保存文本属性(大小)
    NSDictionary *dic = @{NSFontAttributeName:[ UIFont systemFontOfSize:28 *kScreenWidth]};
    //预设尺寸 文本最大不超过这个尺寸
    //根据设置的高度计算高度(宽度和label保持一致)
    CGSize size = CGSizeMake(530 * kScreenWidth , 1000);
    //根据文本 计算出cgrect
    //参数1 尺寸范围
    //参数2 文本属性
    //参数3 按照什么方式获取rect
    CGRect rect = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    //返回得到的高度
    return rect.size.height;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
