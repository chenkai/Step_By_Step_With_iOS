//
//  Category+Reminder.h
//  BasicSample
//
//  Created by chenkai on 15/2/12.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "CategoryView.h"

/**
 * Define Category 定义类别.
 * Reminder 即为类别名称.
 * 关于扩展的类别声明和实现文件 有一个约定俗成命名习惯是 “原类名+Category” 方式命名
 */
@interface CategoryView(Reminder)

- (void) ReminderCustomerPayment:(NSString *)reminderText language:(NSString *)language;

@end

