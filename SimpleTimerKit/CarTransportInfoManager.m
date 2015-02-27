//
//  CarTransportInfoManager.m
//  BasicSample
//
//  Created by chenkai on 15/2/27.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CarTransportInfoManager.h"

@implementation CarTransportInfoManager

-(NSString *)carTransportRodeMapInfo:(NSString *)carNum{
    return carNum.length > 0 ? [NSString stringWithFormat:@"Current Car %@ on the road",carNum] : @"can't find this car";
}

@end