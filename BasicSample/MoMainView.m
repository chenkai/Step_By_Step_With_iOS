//
//  MoMainView.m
//  BasicSample
//
//  Created by chenkai on 15/1/19.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "MoMainView.h"

@interface MoMainView ()

@property UIButton *controlsBut;

@end

@implementation MoMainView

- (instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initControlBut];
    }
    return self;
}

- (void) initControlBut{
    self.controlBut = [[UIButton alloc] initWithFrame:CGRectMake(50, 80, 280, 45)];
    [self.controlBut setTitle:@"System Controls" forState:UIControlStateNormal];
    [self.controlBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.controlBut setBackgroundColor:[UIColor grayColor]];
    [self addSubview:self.controlBut];
}

@end