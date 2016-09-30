//
//  AppDelegate.m
//  PMSC
//
//  Created by 李锐 on 16/8/20.
//  Copyright © 2016年 李锐. All rights reserved.
//

#import "AppDelegate.h"
#import "MyViewController.h"
#import "BaseNaviViewController.h"
#import "ShopViewController.h"
#import "ShopViewController.h"
#import "MyViewController.h"
#import "LoginViewController.h"
#import "GuideViewController.h"
@interface AppDelegate ()<UIScrollViewDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [xl_HttpManager httpManagerXLNetworkReachabilityManage];

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.tabBarVC = [[BaseTabBarViewController alloc] init];

      [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    if ([userDefault objectForKey:@"isFirst"] == nil) {
        [userDefault setObject:@"已经启动过程序了" forKey:@"isFirst"];
        GuideViewController *guid = [[GuideViewController alloc] init];
        self.window.rootViewController = guid;
        NSLog(@"第一次启动程序");
    }
    else{
    self.window.rootViewController =self.tabBarVC;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarAction:) name:@"选择点击tabbarItem" object:nil];

      return YES;
}
#pragma mark 更换tabbar
- (void)tabBarAction:(NSNotification *)noti
{

    if ([[noti.userInfo objectForKey:@"VC"] isKindOfClass:[ShopViewController class]]) {
        self.tabBarVC = [[BaseTabBarViewController alloc] init];
        self.window.rootViewController =self.tabBarVC;
        self.tabBarVC.selectedIndex = 1;
    }

}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
