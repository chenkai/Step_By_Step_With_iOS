//
//  TimerPackageManager.m
//  BasicSample
//
//  Created by chenkai on 15/2/27.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TimerPackageManager.h"

@implementation TimerPackageManager

- (void)mergePackageInfoByAddress:(NSString *)targetAddress{
    if (targetAddress.length > 0) {
        NSLog(@"This Package %@ Send From BeiJing By ChenKai",targetAddress);
    }
}

@end