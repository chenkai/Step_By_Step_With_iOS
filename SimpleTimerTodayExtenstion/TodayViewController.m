//
//  TodayViewController.m
//  SimpleTimerTodayExtenstion
//
//  Created by chenkai on 15/2/27.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //监听是否触发Home键挂起程序
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerTheWillResignActive:) name:UIApplicationWillResignActiveNotification object:nil];
    
    //监听是否重新进入应用程序
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(observerTheBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    //自定义一个UILable显示通知栏中.
    UILabel *customerUserName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 60)];
    customerUserName.text = @"hi chenkai";
    customerUserName.textColor = [UIColor whiteColor];
    [self.view addSubview:customerUserName];
}

- (void) observerTheWillResignActive:(NSNotification *)notification{
    NSLog(@"Goto Background[Reign Active]");
}

- (void) observerTheBecomeActive:(NSNotification *)notification{
    NSLog(@"Goto Foreground[Become Active]");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
