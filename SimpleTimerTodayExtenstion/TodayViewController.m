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

    completionHandler(NCUpdateResultNewData);
}

@end
