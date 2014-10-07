//
//  HWAppDelegate.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "HWAppDelegate.h"
#import "HWHomeViewController.h"
#import "HWMessageCenterViewController.h"
#import "HWDiscoverViewController.h"
#import "HWProfileViewController.h"

@implementation HWAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 2.设置根控制器
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbarVc;
    
    // 3.设置子控制器
    HWHomeViewController *home = [[HWHomeViewController alloc] init];
    [self addChildVc:home title:@"首页" image:@"tabbar_home" selectedImage:@"tabbar_home_selected"];
    
    HWMessageCenterViewController *messageCenter = [[HWMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectedImage:@"tabbar_message_center_selected"];
    
    HWDiscoverViewController *discover = [[HWDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectedImage:@"tabbar_discover_selected"];
    
    HWProfileViewController *profile = [[HWProfileViewController alloc] init];
    [self addChildVc:profile title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_selected"];
    
    [tabbarVc addChildViewController:home];
    [tabbarVc addChildViewController:messageCenter];
    [tabbarVc addChildViewController:discover];
    [tabbarVc addChildViewController:profile];
    //    tabbarVc.viewControllers = @[vc1, vc2, vc3, vc4];
    
    // 很多重复代码 ---> 将重复代码抽取到一个方法中
    // 1.相同的代码放到一个方法中
    // 2.不同的东西变成参数
    // 3.在使用到这段代码的这个地方调用方法， 传递参数
    
    // 4.显示窗口
    [self.window makeKeyAndVisible];
    return YES;
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字和图片
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(123, 123, 123);
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    childVc.view.backgroundColor = HWRandomColor;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

//    UIViewController *vc1 = [[UIViewController alloc] init];
//    vc1.tabBarItem.title = @"首页";
//    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
//    // 声明：这张图片按照原始的样子显示出来，不要自动渲染成其他颜色（比如蓝色）
//    vc1.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//
//    [vc1.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [vc1.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    vc1.view.backgroundColor = HWRandomColor;
//
//    UIViewController *vc2 = [[UIViewController alloc] init];
//    vc2.tabBarItem.title = @"消息";
//    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
//    vc2.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_message_center_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [vc2.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [vc2.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    vc2.view.backgroundColor = HWRandomColor;
//
//    UIViewController *vc3 = [[UIViewController alloc] init];
//    vc3.tabBarItem.title = @"发现";
//    vc3.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
//    vc3.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_discover_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [vc3.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [vc3.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    vc3.view.backgroundColor = HWRandomColor;
//
//    UIViewController *vc4 = [[UIViewController alloc] init];
//    vc4.tabBarItem.title = @"我";
//    vc4.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
//    vc4.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_profile_selected"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    [vc4.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
//    [vc4.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
//    vc4.view.backgroundColor = HWRandomColor;
@end
