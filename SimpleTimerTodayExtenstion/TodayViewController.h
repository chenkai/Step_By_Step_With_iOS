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
//因为作为插件，需要遵守更严格的沙盒限制，所以有一些 API 是不能使用的。为了避免这个警告，我们需要在 framework 的 target
//中声明在我们使用扩展可用的 API。具体在 SimpleTimerKit 的 target 的 General 选项卡中，将 Deployment Info 中的
//Allow app extension API only 勾选上就可以了。关于在扩展里不能使用的 API，都已经被 Apple 标上了 NS_EXTENSION_UNAVAILABLE
//否则Xcode 会一直提示引用这个共用Framework not safe.

//至于关于Widget中不能使用的API 列表见这里:
//https://gist.github.com/joeymeyer/0cb033698bfa5a0420f6
@end
