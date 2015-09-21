//
//  RHBAppDelegate.m
//  RqHelperBox
//
//  Created by 波 李 on 12-7-15.
//  Copyright (c) 2012年 北京润乾. All rights reserved.
//

#import "RHBAppDelegate.h"

#import "RHBFirstViewController.h"

#import "RHBSecondViewController.h"

#import "RHBTableListViewController.h"

#import "RHBSetsViewController.h"
#import "RHBGridViewItem.h"
#import "RHBAPPSetting.h"
#import "JSONKit.h"
#import "RHBCommonUtil.h"

@implementation RHBAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //知识库
    UIViewController *viewController1 = [[RHBFirstViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController* nav1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    RHBAPPSetting* appset = [[RHBAPPSetting alloc] init];
    nav1.navigationBar.tintColor = [appset navColor];
    [viewController1 release];
    
    //润乾表达式
    UIViewController *viewController2 = [[RHBSecondViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController* nav2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    nav2.navigationBar.tintColor = [appset navColor];
    [viewController2 release];
    
    //润乾api
    RHBTableListViewController *apivc = [[RHBTableListViewController alloc] initWithNibName:nil
                                                                              bundle:nil];
    UINavigationController* nav3 = [[UINavigationController alloc] initWithRootViewController:apivc];
    nav3.navigationBar.tintColor = [appset navColor];
    
    NSString* apicontent =  [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apis" ofType:@"json"] encoding:NSUTF8StringEncoding error:nil];
    NSDictionary* apivcdic = [apicontent objectFromJSONString];
    NSString* key = @"API专题";
    apivc.title = key;
    apivc.tabBarItem.image = [UIImage imageNamed:@"tabapi.png"];
    apivc.navigationItem.title = key;
    id arr = [apivcdic objectForKey:key];
    apivc.datapro = arr;
    [apivc release];
    
    //set
    //UIViewController *viewController5 = [[RHBYouMiWallViewController alloc] initWithNibName:nil bundle:nil];
    
    self.tabBarController = [[[UITabBarController alloc] init] autorelease];
    self.tabBarController.tabBar.tintColor = [appset tabColor];
    [appset release];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:nav1, nav2,nav3,nil];//viewController5, 
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    [nav1 release];
    [nav2 release];
    [nav3 release];
    //[viewController5 release];
    return YES;
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
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
