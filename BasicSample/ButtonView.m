//
//  ButtonView.m
//  BasicSample
//
//  Created by chenkai on 15/1/29.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ButtonView.h"

@implementation ButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.tintColor = [UIColor greenColor];
        //[self initUIButtonElement];
        [self initImageButton];
    }
    return self;
}

- (void)initUIButtonElement{
    self.controlBut = [[UIButton alloc] initWithFrame:CGRectMake(50, 80, 280, 45)];
    self.controlBut.backgroundColor = [UIColor grayColor];//背景色
    [self.controlBut setTitle:@"Jack Lin Developer" forState:UIControlStateNormal];//Title文本
    [self.controlBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];//Title颜色
    
 
    //UIButton Type [ReadOnly Property]
    [UIButton buttonWithType:UIButtonTypeSystem];//System
    [UIButton buttonWithType:UIButtonTypeRoundedRect];//Rounded Rect
    [UIButton buttonWithType:UIButtonTypeInfoDark];//Infor Dark
    NSLog(@"ButtonType:%ld",_controlBut.buttonType);
    
    //设置图片[UIControlStateType]
    [_controlBut setBackgroundImage:[UIImage imageNamed:@"Girl.jpg"] forState:UIControlStateNormal];//Normal 正常
    [_controlBut setBackgroundImage:[UIImage imageNamed:@"Device.jpg"] forState:UIControlStateHighlighted];//Hightlighted 高亮 手指按到控件
    [_controlBut setBackgroundImage:[UIImage imageNamed:@"School.jpg"] forState:UIControlStateSelected];//手指离开控件时 Selected
    [_controlBut setBackgroundImage:[UIImage imageNamed:@"School.jpg"] forState:UIControlStateDisabled];//Disabled 状态
    
    
    //点击事件
    [_controlBut addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:self.controlBut];
}

- (void)initImageButton{
    _imageBut = [[UIButton alloc] initWithFrame:CGRectMake(50,145, 280, 45)];
    [_imageBut setTitle:@"Image Button" forState:UIControlStateNormal];
    //[_imageBut setImage:[UIImage imageNamed:@"Girl.jpg"] forState:UIControlStateNormal];
    [self addSubview:_imageBut];
}

- (void)buttonClickAction{
    UIAlertView *sayHellowView = [[UIAlertView alloc] initWithTitle:@"Say Hi"
                                                           message:@"hello chenkai,some special comment for you"
                                                          delegate:self
                                                 cancelButtonTitle:@"click me"
                                                 otherButtonTitles: nil];
    [sayHellowView show];
}

@end