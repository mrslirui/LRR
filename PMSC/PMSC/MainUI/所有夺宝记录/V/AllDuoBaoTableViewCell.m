//
//  AllDuoBaoTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AllDuoBaoTableViewCell.h"

@implementation AllDuoBaoTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.head = [UIImageView new];
        [self.contentView addSubview:_head];
        self.title = [UILabel new];
        [self.contentView addSubview:_title];
        self.people = [UILabel new];
        [self.contentView addSubview:_people];
        self.time = [UILabel new];
        [self.contentView addSubview:_time];
        self.peopleView = [UIImageView new];
        [self.contentView addSubview:_peopleView];
        self.timeView = [UIImageView new];
        [self.contentView addSubview:_timeView];
        _peopleView.image = [UIImage imageNamed:@"renci@3x_1"];
        _timeView.image = [UIImage imageNamed:@"time@3x"];
        _title.textColor =kHexColor(0x012643);
        _title.font = [UIFont systemFontOfSize:30 *kScreenWidth];
   
        _people.textColor =kHexColor(0xfe6a00);
        _people.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        _time.textColor =kHexColor(0x707070);
        _time.font = [UIFont systemFontOfSize:28 *kScreenWidth];
        _head.backgroundColor = [UIColor yellowColor];

    }
    return self;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.head.frame = CGRectMake(19*kScreenWidth, 20*kScreenHeight, 84*kScreenHeight, 84*kScreenHeight);
    self.title.frame = CGRectMake(_head.right + 27*kScreenWidth, _head.top, 549*kScreenWidth,55*kScreenHeight);
    self.peopleView.frame = CGRectMake(_title.left, _title.bottom, 30*kScreenHeight, 30*kScreenHeight);
    self.people.frame = CGRectMake(_peopleView.right+10*kScreenWidth, _peopleView.top, _title.width, 30*kScreenHeight);
    self.timeView.frame = CGRectMake(_peopleView.left, _peopleView.bottom+10*kScreenHeight, _peopleView.width, _peopleView.height);
    self.time.frame = CGRectMake(_timeView.right +20*kScreenWidth, _timeView.top, _people.width, _people.height);
    _head.layer.cornerRadius = _head.width /2;

    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
