//
//  DelegateView.h
//  BasicSample
//
//  Created by chenkai on 15/2/11.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <UIKit/UIKit.h>

//Define Protocol
//协议简单来说就是定义一系列不属于任何类的方法和属性列表.其中声明的方法和属性可以被任何类实现.
//这种模式一般称为代理. 可以通过Protocol定义各种行为 可以不同场景采用不同的实现.
//主要用在View和Controller上解耦.
@protocol FirstDelegate <NSObject>

@required //预编译指令 表示该方式必须实现 [默认为Required]
- (void)outPutCustomerOrderDetail:(NSInteger) customerId;

@optional //预编译指令 标示该方法实现可选
- (void)addPrintTimeStamp:(NSString *) customerOrderDetail;

@property NSString *customerAddress;//可以定义属性 [默认为Required]

@optional
@property NSString *customerTelNum;

@end

//Define Protocol
@protocol SecondDelegate <NSObject>

@property NSString *customerName;

- (void)outputOrderAddCustomerName:(NSInteger) customerId;

@end

@interface DelegateView : UIView<FirstDelegate,SecondDelegate>


@end