//
//  MoAppDelegate.m
//  BasicSample
//
//  Created by chenkai on 15/1/19.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MoAppDelegate.h"
#import "MoViewController.h"

@implementation MoAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MoViewController *basicViewController = [[MoViewController alloc] init];
    UINavigationController *baseNavigationController = [[UINavigationController alloc] initWithRootViewController:basicViewController];
    self.window.rootViewController = baseNavigationController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end