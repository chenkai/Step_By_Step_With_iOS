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


-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    if ([url.scheme isEqualToString:@"Baisci"]) {
        if ([url.host isEqualToString:@"finished"]) {
            UIAlertView *finishedView = [[UIAlertView alloc] init];
            finishedView.title = @"finished";
            [finishedView show];
        }
    }
    return FALSE;
}

@end