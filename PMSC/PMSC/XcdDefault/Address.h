//
//  Address.h
//  PMSC
//
//  Created by 李锐 on 16/9/21.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void (^LOGINBLOCK) (void) ;/*** 成功返回回调 **/

@interface Address : NSObject
#define K_URL @"http://gangmaduobao.com/?"
//积分兑换
#define ChangeManager [NSString stringWithFormat:@"%@%@",K_URL,@"/api/my/dhzs"]

//开奖
#define Kaijiang [NSString stringWithFormat:@"%@%@",K_URL,@"/api/index1/kj"]

//我的帖子
#define mycard [NSString stringWithFormat:@"%@%@",K_URL,@"/api/my/json_mycard"]

//中将收获
#define Order [NSString stringWithFormat:@"%@%@",K_URL,@"/api/order/od"]

//充值记录
#define Paylog [NSString stringWithFormat:@"%@%@",K_URL,@"/api/paylog/lg"]

//删除购物车
#define Cartdel [NSString stringWithFormat:@"%@%@",K_URL,@"/api/cart/json_cartdel"]

//注册
#define Register [NSString stringWithFormat:@"%@%@",K_URL,@"/api/user/register"]

//验证码
#define GetVerify [NSString stringWithFormat:@"%@%@",K_URL,@"/api/verify/getverify"]

//夺宝记录
#define Snatch [NSString stringWithFormat:@"%@%@",K_URL,@"/api/snatch/sc"]

//查看购物车
#define Cartshow [NSString stringWithFormat:@"%@%@",K_URL,@"/api/cart/json_cartshow"]

//加入购物车
#define Cartadd [NSString stringWithFormat:@"%@%@",K_URL,@"/api/cart/json_cartadd"]

//赏
#define Shang [NSString stringWithFormat:@"%@%@",K_URL,@"/api/card/json_reward"]

//帖子列表
#define PostList [NSString stringWithFormat:@"%@%@",K_URL,@"/api/card/json_cardlist"]

//基本信息
#define BaseMessage [NSString stringWithFormat:@"%@%@",K_URL,@"/api/my/mj"]

//我的
#define My [NSString stringWithFormat:@"%@%@",K_URL,@"/api/my/mm"]

//添加地址
#define AddAddress [NSString stringWithFormat:@"%@%@",K_URL,@"/api/dizhitj/tj"]


//登录
#define Login [NSString stringWithFormat:@"%@%@",K_URL,@"/api/user/login"]

//商品列表
#define ShopList [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_shoplist"]

//往期揭晓
#define Publish [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_publish"]

//地址管理
#define AddressManager [NSString stringWithFormat:@"%@%@",K_URL,@"/api/dizhigl/dz"]

//分类列表
#define ShopCate [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_shopcate"]

//问题详情
#define IssueList [NSString stringWithFormat:@"%@%@",K_URL,@"/api/help/issuelist"]

//晒单分享
#define ShopShare [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_shopshare"]

//商品详情
#define ShopDetail [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_detail"]

//地址删除
#define AddressDelete [NSString stringWithFormat:@"%@%@",K_URL,@"/api/dizhidel/dzdel"]

//商品晒单
#define GoodShare [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_goodshare"]

//所有夺宝记录
#define ALLindiana [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_indiana"]

//商城
#define ShopFist [NSString stringWithFormat:@"%@%@",K_URL,@"/api/index1/glist"]

//搜索
#define Search  [NSString stringWithFormat:@"%@%@",K_URL,@"/api/shop/json_search"]

//关于我们
#define AboutUs [NSString stringWithFormat:@"%@%@",K_URL,@"/api/about/ab"]

//提问
#define Question [NSString stringWithFormat:@"%@%@",K_URL,@"/api/help/issue"]

//帮助
#define Help [NSString stringWithFormat:@"%@%@",K_URL,@"/api/help/hp"]

//发帖接口
#define CPUBLIC [NSString stringWithFormat:@"%@%@",K_URL,@"/api/card/json_cpublic"]
//跑马homepage接口
#define homepage [NSString stringWithFormat:@"%@%@",K_URL,@"/api/paoma/homepage"]
//帖子详情接口
#define cdetail [NSString stringWithFormat:@"%@%@",K_URL,@"/api/card/json_cdetail"]
#define TOKEN  [[NSUserDefaults standardUserDefaults] objectForKey:@"token"]


+(void)pushLoginWithBlock:(LOGINBLOCK)block;
@end
