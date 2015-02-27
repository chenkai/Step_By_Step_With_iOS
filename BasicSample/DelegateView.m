//
//  DelegateView.m
//  BasicSample
//
//  Created by chenkai on 15/2/11.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "DelegateView.h"

@implementation DelegateView

@synthesize customerAddress;
@synthesize customerName;

- (instancetype)initWithFrame:(CGRect)frame{
     self = [super initWithFrame:frame];
    //判断某个类是否已经实现某个Protocol协议
    if (self) {
        if ([self conformsToProtocol:@protocol(SecondDelegate)]) {
            NSLog(@"Implementation Second Delegate");
        }
        
        if ([self conformsToProtocol:@protocol(FirstDelegate)]){
            NSLog(@"Implementation First Delegate");
        }
        
        if ([self conformsToProtocol:@protocol(ThreeDelegate)]) {
            NSLog(@"Implementation Three Delegate");
        }
    }

    return self;
}

-(void)outPutCustomerOrderDetail:(NSInteger)customerId{
    if (customerId > 0) {
        NSLog(@"hi JeffyChen You Customer Order Is Send To Print,CustomerId:%ld",(long)customerId);
    }
}

-(void)addPrintTimeStamp:(NSString *)customerOrderDetail{
    customerOrderDetail = [customerOrderDetail stringByAppendingString:@"Order Check TimeStamp:4512"];
    NSLog(@"TimeStamp Has Added To Order Detail:%@",customerOrderDetail);
}

-(void)outputOrderAddCustomerName:(NSInteger)customerId{
    if (customerId > 0) {
        customerAddress = @"Order Detail has add Customer Name";
        NSLog(@"status:%@",customerAddress);
    }
}

-(void)getCustomerLocationServiceData:(NSInteger)customerId locationArea:(NSString *)locationAreaId{
    if ([locationAreaId length] > 0) {
        NSLog(@"Customer Location Area is China Streat");
    }
}

@end