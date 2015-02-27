//
//  TodayViewController.h
//  SimpleTimerTodayExtenstion
//
//  Created by chenkai on 15/2/27.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TodayViewController : UIViewController

//关于Widget和Host App 共用Framework 有两个需要注意地方:

//A:调用方式

//Widget调用Frameword 方式是：
//选中Target公共库中General选项卡找到Linked Framework And Libraries 添加共用库即可.


//B:解除警告的方式

//当调用完成Buided Success之后会有一个警告如下 "linking against dylib not safe for use in application extensions"
//这个是因为共用Framework[SimpleTimerKit]的Building Setting设置中 有一个选项“Require Only App-Extension-Safe API” 必须设置为Yes
//否则Xcode 提示引用这个共用Framework not safe.
@end
