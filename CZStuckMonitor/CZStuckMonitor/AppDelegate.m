//
//  AppDelegate.m
//  CZStuckMonitor
//
//  Created by 赵曙诚 on 2020/5/12.
//  Copyright © 2020 赵曙诚. All rights reserved.
//

#import "AppDelegate.h"
#import "CZStuckMonitor.h"
#import "CZRootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[CZRootViewController alloc] init];
    [self.window makeKeyAndVisible];    
    return YES;
}

@end
