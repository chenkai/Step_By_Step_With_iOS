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
        [self initUIButtonElement];
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
    
    NSLog(@"title value:%@",_controlBut.currentTitle);
    [self addSubview:self.controlBut];
}

- (void)initImageButton{
    _imageBut = [[UIButton alloc] initWithFrame:CGRectMake(50,145, 280, 45)];
    [_imageBut setTitle:@"Image Button" forState:UIControlStateNormal];
    [_imageBut setBackgroundColor:[UIColor grayColor]];
    [_imageBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //[_imageBut setImage:[UIImage imageNamed:@"Girl.jpg"] forState:UIControlStateNormal];
    
    //UIControl Common Property [Enabled]
    _imageBut.enabled =YES;
    
    //[Selected]
    _imageBut.selected = YES;
    
    //[ContentVerticalAlignment] & [ContentModel]
    _imageBut.contentMode = UIViewContentModeLeft;
    _imageBut.contentHorizontalAlignment = UIControlContentVerticalAlignmentCenter;
    
    //Register Event
    [_imageBut addTarget:self action:@selector(imageButtonEvent:) forControlEvents:UIControlEventTouchDown];
    [_imageBut addTarget:self action:@selector(imageButtonTouchDownRepeat) forControlEvents:UIControlEventTouchDownRepeat];
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragInside) forControlEvents:UIControlEventTouchDragInside];
    
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragOutside) forControlEvents:UIControlEventTouchDragOutside];
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragEnter) forControlEvents:UIControlEventTouchDragEnter];
    
    
    //UIControlEventTouchDown 单点触摸按下时间:用户点触屏幕，或者又有新手指落下时候触发.
    //UIControlEventTouchDownRepeat 多点触摸按下事件：点触计数大于1-用户按下第二 三或第四手指触发.
    
    //UIControlEventTouchDragInside 当一次触摸控件窗口内拖动时触发
    //UIControlEventTouchDragOutside 当一次触摸控件窗口外拖动是触发
    //UIControlEventTouchDragEnter 当一次触摸控件从窗口之外拖动到内部时触发
    
    _imageBut.showsTouchWhenHighlighted = YES;
    [self addSubview:_imageBut];
}

#pragma mark Run Sample Of Button Event

- (void)imageButtonEvent:(id)sender{
    NSLog(@"click TouchDown Event");
    CGRect screenBounds = [[UIScreen mainScreen] bounds];//返回带状态栏的Rect
    CGRect viewBounds = [[UIScreen mainScreen] applicationFrame];//不包含状态栏的Rect
    
    NSLog(@"带有状态栏Rect值height:%f  width:%f",screenBounds.size.height, screenBounds.size.width);
    NSLog(@"不带状态栏Rect值height:%f  width:%f",viewBounds.size.height,viewBounds.size.width);
    NSLog(@"状态栏的height高度:%f",screenBounds.size.height - viewBounds.size.height);//状态栏固定高度 20 px
    
    //查看Origin 的值
    NSLog(@"带有状态栏的Origin值X:%f",screenBounds.origin.x);
    NSLog(@"带有状态栏的Origin值Y:%f",screenBounds.origin.y);
    
    //设置Title Shadow Color
    [_imageBut setTitleShadowColor:[UIColor redColor] forState:UIControlStateNormal];
    _imageBut.adjustsImageWhenDisabled = NO;
    
    
    //Argument With Button
//    UIButton *convertButton = (UIButton *)sender;
//    if (convertButton != nil) {
//        [convertButton setTitle:@"Clicked" forState:UIControlStateNormal];
//    }
    
}

- (void)imageButtonTouchDownRepeat{
    NSLog(@"click TouchDown Repeat Event");
}

- (void)imageButtonTouchDragInside{
    NSLog(@"click TouchDrag Inside Event");
}

- (void)imageButtonTouchDragOutside{
    NSLog(@"click TouchDrag Outside Event");
}

- (void)imageButtonTouchDragEnter{
    NSLog(@"click TouchDrag Enter Event");
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