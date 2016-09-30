//
//  PayTableViewCell.m
//  PMSC
//
//  Created by 李锐 on 16/9/2.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "PayTableViewCell.h"

@interface PayTableViewCell ()
@property(nonatomic,retain)UIView *line;
@end
@implementation PayTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [UIImageView new];
        [self.contentView addSubview:_imgView];
        self.titleLabel =[ UILabel new];
        [self.contentView addSubview:_titleLabel];
        self.peopleCount = [UILabel new];
        [self.contentView addSubview:_peopleCount];
        self.joinPeople = [UILabel new];
        [self.contentView addSubview:_joinPeople];
        self.joinDate = [UILabel new];
        [self.contentView addSubview:_joinDate];
        self.buttonSubtract = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonSubtract];
        self.quantity = [UILabel new];
        [self.contentView addSubview:_quantity];
        self.buttonAdd = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonAdd];
        self.buttonSubtract1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonSubtract1];
        self.quantity1 = [UILabel new];
        [self.contentView addSubview:_quantity1];
        self.buttonAdd1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_buttonAdd1];
        self.imgView.backgroundColor = [UIColor redColor];
        _titleLabel.font = [UIFont systemFontOfSize:30*kScreenWidth];
        _peopleCount.font = [UIFont systemFontOfSize:26*kScreenWidth];
        _joinDate.font = [UIFont systemFontOfSize:26*kScreenWidth];
        _joinPeople.font = [UIFont systemFontOfSize:26*kScreenWidth];
        [self.buttonSubtract setImage:[UIImage imageNamed:@"图层-25-副本@3x"] forState:0];
        [self.buttonAdd setImage:[UIImage imageNamed:@"图层-26-副本@3x"] forState:0];
        
        [self.buttonSubtract1 setImage:[UIImage imageNamed:@"图层-25-副本@3x"] forState:0];
        [self.buttonAdd1 setImage:[UIImage imageNamed:@"图层-26-副本@3x"] forState:0];
        
        self.quantity.layer.borderWidth  = 1;
        self.quantity.layer.borderColor = kHexColor(0xcecece).CGColor;
        self.quantity1.layer.borderWidth  = 1;
        self.quantity1.layer.borderColor = kHexColor(0xcecece).CGColor;
        self.quantity.textAlignment = NSTextAlignmentCenter;
        self.quantity1.textAlignment = NSTextAlignmentCenter;
        self.peopleCount.textColor = kHexColor(0x878787);
        self.joinDate.textColor = kHexColor(0x878787);
        self.joinPeople.textColor = kHexColor(0x878787);
        self.line = [UIView new];
        [self.contentView addSubview:_line];
        _line.backgroundColor = kHexColor(0xeeeeee);
        self.jiesuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:_jiesuanBtn];
        
        [_jiesuanBtn setTitle:@"结算" forState:0];
        _jiesuanBtn.backgroundColor = kAppColor;
         _jiesuanBtn.titleLabel.font = [UIFont systemFontOfSize:27*kScreenWidth];
        
    }
    return self;
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
   
    self.titleLabel.frame = CGRectMake( 10*kScreenWidth,0, Screen_WIDTH, 88*kScreenHeight);
    self.line.frame = CGRectMake(0, 88*kScreenHeight, Screen_WIDTH, 0.5);
     self.imgView.frame = CGRectMake(29*kScreenWidth, _titleLabel.bottom+21*kScreenHeight, 180*kScreenHeight, 180*kScreenHeight);
    self.peopleCount.frame = CGRectMake(_imgView.right + 10*kScreenWidth, _titleLabel.bottom +21*kScreenHeight , _titleLabel.width, 20*kScreenHeight);
    self.joinPeople .frame = CGRectMake(_imgView.right + 10*kScreenWidth, _peopleCount.bottom+10*kScreenHeight, 120*kScreenWidth, 63*kScreenHeight);
    self.joinDate.frame = CGRectMake(_imgView.right + 10*kScreenWidth, _joinPeople.bottom, _joinPeople.width, _joinPeople.height);
    self.buttonSubtract.frame = CGRectMake(_joinPeople.right+10*kScreenWidth, _peopleCount.bottom+10*kScreenHeight, 89*kScreenWidth, 63*kScreenHeight);
    self.quantity.frame = CGRectMake(_buttonSubtract.right-10*kScreenHeight, _buttonSubtract.top+10*kScreenHeight, 100*kScreenWidth, 40*kScreenHeight);
    self.buttonAdd.frame = CGRectMake(_quantity.right, _buttonSubtract.top, _buttonSubtract.width, _buttonSubtract.height);
    
    
    self.buttonSubtract1.frame = CGRectMake(_joinDate.right+10*kScreenWidth, _joinPeople.bottom, 89*kScreenWidth, 63*kScreenHeight);
    self.quantity1.frame = CGRectMake(_buttonSubtract1.right-10*kScreenHeight, _buttonSubtract1.top+10*kScreenHeight, 100*kScreenWidth, 40*kScreenHeight);
    self.buttonAdd1.frame = CGRectMake(_quantity1.right, _buttonSubtract1.top, _buttonSubtract1.width, _buttonSubtract1.height);
    _jiesuanBtn.frame = CGRectMake(self.right - 86*kScreenWidth,_line.bottom, 86*kScreenWidth, 222*kScreenHeight);
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
