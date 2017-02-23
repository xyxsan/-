//
//  AppDelegate.m
//  side
//
//  Created by carbonzhao on 16/9/29. 技术合作qq:2178785450
//  Copyright © 2016年 appleDeveloper. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    LeftViewController *leftCt = [[LeftViewController alloc] init];
    [leftCt.navigationItem setHidesBackButton:YES];
    UINavigationController *leftNavController = [[UINavigationController alloc] initWithRootViewController:leftCt];
    [leftNavController.navigationBar setBackgroundImage:[UIImage imageNamed:@"leftBar"] forBarMetrics:UIBarMetricsDefault];
    [leftCt release];
    
    RightViewController *rightCt = [[RightViewController alloc] init];
    [rightCt.navigationItem setHidesBackButton:YES];
    UINavigationController *rightNavController = [[UINavigationController alloc] initWithRootViewController:rightCt];
    [rightNavController.navigationBar setBackgroundImage:[UIImage imageNamed:@"leftBar"] forBarMetrics:UIBarMetricsDefault];
    [rightCt release];
    
    RootViewController *rootCt = [[RootViewController alloc] init];
    [rootCt.navigationItem setHidesBackButton:YES];
    UINavigationController *rootNavController = [[UINavigationController alloc] initWithRootViewController:rootCt];
    [rootNavController.navigationBar setBackgroundImage:[UIImage imageNamed:@"barBg"] forBarMetrics:UIBarMetricsDefault];
    [rootCt release];
    
    UIMarginViewController *marginController = [[UIMarginViewController alloc] initWithRootViewController:rootNavController];
    [rootNavController release];
    [marginController setLeftViewController:leftNavController];
    [marginController setRightViewController:rightNavController];
    [leftNavController release];
    [rightNavController release];
    
    [marginController setLeftViewWidth:[UIScreen mainScreen].bounds.size.width*.7];
    [marginController setRightViewWidth:[UIScreen mainScreen].bounds.size.width*.7];
    [marginController setShouldShowMarginShadow:YES];
    [marginController setLeftBarButtonImage:[UIImage imageNamed:@"listLeft"]];
    [marginController setRightBarButtonImage:[UIImage imageNamed:@"listLeft"]];
    [marginController setShouldShowViewShadow:NO];
    [marginController setViewShadowAlpha:.3];
    [marginController setShouldAlwaysShowMarginBarView:YES];
    
    [self.window setRootViewController:marginController];
    
    [marginController release];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
