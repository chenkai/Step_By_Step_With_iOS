//
//  TodayViewController.m
//  SimpleTimerTodayExtenstion
//
//  Created by chenkai on 15/2/27.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "TimerPackageManager.h"
#import "CarTransportInfoManager.h"

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
//    UILabel *customerUserName = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 60)];
//    customerUserName.text = @"hi chenkai";
//    customerUserName.textColor = [UIColor whiteColor];
//    [self.view addSubview:customerUserName];
    
    //测试引入第三方库是否成功调用
    TimerPackageManager *packageManager = [[TimerPackageManager alloc] init];
    [packageManager mergePackageInfoByAddress:@"Da Yuan Road"];
    
    CarTransportInfoManager *transportManager = [[CarTransportInfoManager alloc] init];
    NSLog(@"%@", [transportManager carTransportRodeMapInfo:@"Dong Ming"]);

    //增加一个自定义按钮
    [self initButtonCallMainApplication];
    
    //设置Widget 区域
    //设置preferredContentSize 宽度无论设置什么值都是无效的
    //系统会自动处理为整屏的宽度
    self.preferredContentSize =CGSizeMake(0, 200);
}

- (void) initButtonCallMainApplication{
    UIButton *callBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 10, 100, 60)];
    [callBut setTitle:@"Call Main" forState:UIControlStateNormal];
    [callBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [callBut addTarget:self action:@selector(callButtonPressed) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:callBut];
}

- (void) callButtonPressed {
    NSURL *callUrl = [[NSURL alloc] initWithString:@"Baisci://finised"];
    [self.extensionContext openURL:callUrl completionHandler:^(BOOL success) {
        NSLog(@"call main application finished lol");
    }];
    
    NSLog(@"you call pressed button event");
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

//    对于通知中心扩展，即使你的扩展现在不可见 (也就是用户没有拉开通知中心)，系统也会时不时地调用实现了 NCWidgetProviding
//    的扩展的这个方法，来要求扩展刷新界面。这个机制和 iOS 7 引入的后台机制是很相似的。
//    在这个方法中我们一般可以做一些像 API 请求之类的事情，在获取到了数据并更新了界面，
//    或者是失败后都使用提供的 completionHandler 来向系统进行报告
    
    completionHandler(NCUpdateResultNewData);
}

@end
