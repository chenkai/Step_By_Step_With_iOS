//
//  Category+Reminder.m
//  BasicSample
//
//  Created by chenkai on 15/2/12.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "Category+Reminder.h"
#import "TimerPackageManager.h"
#import "CarTransportInfoManager.h"

@implementation CategoryView(Reminder)

-(void)ReminderCustomerPayment:(NSString *)reminderText language:(NSString *)language{
    if (reminderText.length > 0 && language.length > 0) {
        NSLog(@"hi jackline credit card payment date is expired,Language:%@",language);
    }
    
    //Print Package Address With TimeStamp
    TimerPackageManager *packageManager = [[TimerPackageManager alloc] init];
    [packageManager mergePackageInfoByAddress:@"ChaoYang Dest JinMing Road 104"];
    
    //Get Car Transport Information
    CarTransportInfoManager *transportManager = [[CarTransportInfoManager alloc] init];
    NSLog(@"%@", [transportManager carTransportRodeMapInfo:@"BJCAR_040862_JINMING"]);
}

@end
