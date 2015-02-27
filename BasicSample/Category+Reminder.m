//
//  Category+Reminder.m
//  BasicSample
//
//  Created by chenkai on 15/2/12.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "Category+Reminder.h"

@implementation CategoryView(Reminder)

-(void)ReminderCustomerPayment:(NSString *)reminderText language:(NSString *)language{
    if (reminderText.length > 0 && language.length > 0) {
        NSLog(@"hi jackline credit card payment date is expired,Language:%@",language);
    }
}

@end
