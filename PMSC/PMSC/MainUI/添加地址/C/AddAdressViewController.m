//
//  AddAdressViewController.m
//  PMSC
//
//  Created by 李瑞的工作台 on 16/8/30.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AddAdressViewController.h"
#import "AddTableViewCell.h"
#import "AddSetTableViewCell.h"
#import "AddContactTableViewCell.h"
#import "AddCountryTableViewCell.h"
#import "AddAdressModel.h"
@interface AddAdressViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,UITextFieldDelegate>
{
    BOOL isOn;
}
@property(nonatomic,retain)NSArray *arr;
@property(nonatomic,retain)NSArray *imgArr;
@property(nonatomic,retain)NSArray *arr1;
@property(nonatomic,retain)UIButton *DoneBtn;
@property(nonatomic,retain)NSArray *arr3;
@property(nonatomic,retain)NSString *nameStr; //收货人
@property(nonatomic,retain)NSString *adStr; //联系电话
@property(nonatomic,retain)NSString *provinceStr; //省
@property(nonatomic,retain)NSString *countryStr; //市
@property(nonatomic,retain)NSString *detailStr; //详细地址
@end

@implementation AddAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.arr = @[@"收货人",@"联系电话"];
    self.arr1 = @[@"省",@"市"];
    self.imgArr  = @[@"ren",@"tel"];
    self.arr3 = @[@"请输入姓名",@"请输入有效联系电话"];
    self.navigationItem.title = @"添加地址";
    self.view.backgroundColor = kHexColor(0xeeeeee);
    [self.tableView registerClass:[AddContactTableViewCell class] forCellReuseIdentifier:@"cell3"];
    [self.tableView registerClass:[AddTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [self.tableView registerClass:[AddCountryTableViewCell class] forCellReuseIdentifier:@"cell"];

    [self.tableView registerClass:[AddSetTableViewCell class] forCellReuseIdentifier:@"cell2"];
    self.tableView.scrollEnabled  =NO;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [self bottomView];
}
-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0)
    {
    return _arr.count;
    }
    if(section== 1)
    {
        return _arr.count;
    }if(section == 2)
    {
        return 1;
    }
    if(section == 3)
    {
        return 1;
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
          AddContactTableViewCell   *cell = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        cell.contLb .text = _arr[indexPath.row];
        cell.imgView.image = [UIImage imageNamed:_imgArr[indexPath.row]];
        cell.phone.placeholder = _arr3[indexPath.row];
        cell.phone.tag = indexPath.row;
        [cell.phone addTarget:self action:@selector(textChange:) forControlEvents:UIControlEventEditingChanged];

        return cell;
    }
    else if (indexPath.section ==1)
    {
        AddCountryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.prolabel.text = _arr1[indexPath.row];
        cell.prolabel.textColor = kHexColor(0x000000);
       cell.prolabel.font = [UIFont systemFontOfSize: 30 *kScreenWidth];
        cell.province.placeholder = @"请输入地址";
        cell.province.font = [UIFont systemFontOfSize: 30 *kScreenWidth];
  [cell.province addTarget:self action:@selector(textChangeProvice:) forControlEvents:UIControlEventEditingChanged];
        [cell.province setAutoAdjust:YES];
        cell.province.tag = indexPath.row;
        return cell;
        
    }
    else if (indexPath.section == 2)
    {
        AddTableViewCell *cell1 =[tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell1.textView.text = @"详细地址 请输入详细地址";
        cell1.textView.delegate =self;
        return cell1;
    }
    else
    {
        AddSetTableViewCell *cell2 =[ tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell2.label .text= @"设置为默认";
        UISwitch *switc =  [[UISwitch alloc] initWithFrame: CGRectMake(0, 10 *kScreenHeight, 88*kScreenWidth, 70*kScreenHeight)];

        cell2.accessoryView = switc;
        [switc addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];

        
        return cell2;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section ==2)
        
    {    return 0.1;
    }
    return 12;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 2) {
        return 251 *kScreenHeight;
    }
    
    else if(indexPath.section == 3)
    {
        return 90*kScreenHeight;
    }
    else
    {
        return 87*kScreenHeight;
    
    }
}
#pragma mark -联系人的代理方法
-(void)textChange:(UITextField *)textfield
{
    if (textfield.tag == 0) {
        self.nameStr = textfield.text;
         }
    else
    {
        [BaseTextField textFieldDidChange:textfield Count:11];

        self.adStr = textfield.text;
    }
    NSLog(@"%@ %@",_nameStr,_adStr);

}
#pragma mark -省市区的代理方法
-(void)textChangeProvice:(UITextField *)text
{
    if (text.tag == 0) {
       
        self.provinceStr  =text.text;
        
    }
    else
    {
        self.countryStr = text.text;
    }
}
#pragma mark -uiswitch
-(void)switchAction:(UISwitch *)sender
    {
        if(sender.on)
        {
            isOn = YES;
        }
        else{
            isOn = NO;
        }

    
    }

-(void)bottomView
{
    UIView *foot = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Screen_WIDTH, 400*kScreenHeight)];
    self.tableView.tableFooterView = foot;
    foot.backgroundColor = kHexColor(0xeeeeee);
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, Screen_HEIGHT - 89*kScreenHeight-64, Screen_WIDTH, 89*kScreenHeight)];
    [self.view addSubview:bgView];
    self.DoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.DoneBtn setTitle:@"完成" forState:0];
    self.DoneBtn.backgroundColor = kAppColor;
    [_DoneBtn setTitleColor:[UIColor whiteColor] forState:0];
    [self.DoneBtn addTarget:self action:@selector(done:) forControlEvents:UIControlEventTouchUpInside];
    _DoneBtn.frame = CGRectMake((720 - 674) *kScreenWidth /2, bgView.top, 674*kScreenWidth, 73*kScreenHeight);
    [self.view addSubview:_DoneBtn];
}
#pragma mark -textView delegate
-(void)textViewDidChange:(UITextView *)textView
{
    self.detailStr = textView.text;
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"详细地址 请输入详细地址"]) {
        textView.text= @"";

    }
    
}
-(void)textViewDidEndEditing:(UITextView *)textView
{
    if (textView.text.length == 0) {
        textView.text = @"详细地址 请输入详细地址";
        
    }
}
#pragma mark -完成按钮
-(void)done:(UIButton *)btn
{
    if (_nameStr.length == 0) {
        [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请添加用户名" AndViewController:self];
    }
    else if (_adStr.length == 0)
    {
        if (![XLMethod valiMobile:_adStr]) {
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入正确的手机号" AndViewController:self];
        }
    }
        else if (_detailStr.length == 0)
        {
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入详细地址" AndViewController:self];

        }
        else if(_provinceStr.length== 0){
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入所在省份" AndViewController:self];

        }
        else if (_countryStr.length == 0)
        {
            [AlertAndActionTool showAlertOneWith:@"提示" AndContent:@"请输入所在市" AndViewController:self];

        }
        else{
    NSMutableDictionary *parm = [NSMutableDictionary dictionary];
    [parm setObject:_nameStr forKey:@"shouhuoren"];
    [parm setObject:_adStr forKey:@"mobile"];
    [parm setObject:_provinceStr forKey:@"sheng"];
    [parm setObject:_countryStr forKey:@"shi"];
    [parm setObject:_detailStr forKey:@"jiedao"];
//    [parm setObject:@"长江路" forKey:@"xian"];
    [parm setObject:@"151000" forKey:@"youbian"];
    [parm setObject:TOKEN forKey:@"uid"];
    if(isOn)
    {
        [parm setObject:@"Y" forKey:@"default"];
    }else
    {
        [parm setObject:@"N" forKey:@"default"];
    }
    
    [self loadDic:parm];
        }
}
-(void)loadDic:(NSMutableDictionary *)dict
{
    [AddAdressModel setWithDic:[dict mutableCopy] WithBLOCK:^(id returnValue) {
        
        NSLog(@"%@",returnValue);
        [AlertAndActionTool showCancleAlertWith:@"提示" AndContent:@"地址添加成功" AndViewController:self AndCallBack:^{
            [self.navigationController popViewControllerAnimated:YES];

        }];
    }];
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
