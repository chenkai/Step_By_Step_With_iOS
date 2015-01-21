//
//  MoViewController.m
//  BasicSample
//
//  Created by chenkai on 15/1/19.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "MoViewController.h"
#import "MoMainView.h"
#import "CommonControlViewController.h"

@implementation MoViewController

- (void)loadView{
    [super loadView];
    [self initView];
}

- (void)viewDidLoad{
  
}

- (void)initView{
    MoMainView *mainView =[[MoMainView alloc] init];
    [mainView.controlBut addTarget:self action:@selector(gotoSystemControlView) forControlEvents:UIControlEventTouchDown];
    self.view = mainView;
}

- (void)gotoSystemControlView{
    CommonControlViewController *commonController = [[CommonControlViewController alloc] init];
    [self.navigationController pushViewController:commonController animated:NO];
}

@end
