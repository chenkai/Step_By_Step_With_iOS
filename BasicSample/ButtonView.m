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
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragExist) forControlEvents:UIControlEventTouchDragExit];
    
    
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragUpInside) forControlEvents:UIControlEventTouchUpInside];
    [_imageBut addTarget:self action:@selector(imageButtonTouchDragUpOutside) forControlEvents:UIControlEventTouchUpOutside];
    [_imageBut addTarget:self action:@selector(imageButtonTouchCancel) forControlEvents:UIControlEventTouchCancel];
    
    //UIControlEventTouchDown 单点触摸按下时间:用户点触屏幕，或者又有新手指落下时候触发.
    //UIControlEventTouchDownRepeat 多点触摸按下事件：点触计数大于1-用户按下第二 三或第四手指触发.
    
    //UIControlEventTouchDragInside 当一次触摸控件窗口内拖动时触发
    //UIControlEventTouchDragOutside 当一次触摸控件窗口外拖动是触发
    //UIControlEventTouchDragEnter 当一次触摸控件从窗口之外拖动到内部时触发
    //UIControlEventTouchDragExit 当一次触摸从控件窗口内部拖到外部是.
    
    //UIControlEventTouchUpInside 所有控件在控件之内拖动结束时触摸抬起事件
    //UIControlEventTouchUpOutside 所有控件在控件之外拖动借宿触摸抬起事件【点触必须开始与控件内部才会发送通知 -----没弄明白】
    //UIControlEventTouchCancel 所有触摸取消事件，即一次触摸因为放上了太多手指而被取消，或者被上锁或者电话呼叫打断。
    
    //Get All Target Event List [Remove Before]
    NSSet *eventActions = [_imageBut allTargets];
    NSUInteger counter = [eventActions count];
    NSLog(@"删除前:%lu",(unsigned long)counter);
    
    //Add One Move TouchDown Event
    [_imageBut addTarget:self action:@selector(imageButtonTouchEventTwo) forControlEvents:UIControlEventTouchDown];
    
    //Remove Event
    //[_imageBut removeTarget:self action:@selector(imageButtonEvent:) forControlEvents:UIControlEventTouchDown];
    
    //Get All Target Event List [Remove After]
    //eventActions = [_imageBut allTargets];
    //NSLog(@"删除后:%lu",(unsigned long)[eventActions count]);
    
    //Get Single Action Event Count
//    NSArray *singleSetValue = [_imageBut actionsForTarget:self forControlEvent:UIControlEventTouchDown];
//    NSLog(@"单个TouchDown Event 数量:%lu",(unsigned long)[singleSetValue count]);
    
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
    
}

- (void)imageButtonTouchEventTwo{
    NSLog(@"event two");
}

- (void)imageButtonTouchDownRepeat{
    NSLog(@"Touch Down Repeat Event");
}

- (void)imageButtonTouchDragInside{
    NSLog(@"Drag Inside");
}

- (void)imageButtonTouchDragOutside{
    NSLog(@"Drag Outside Event");
}

- (void)imageButtonTouchDragEnter{
    NSLog(@"Drag Enter Event");
}

- (void)imageButtonTouchDragExist{
    NSLog(@"Drag Exist");
}

- (void)imageButtonTouchDragUpInside{
    NSLog(@"Drag Up Inside");
}

- (void)imageButtonTouchDragUpOutside{
    NSLog(@"Drag Up OutSide");
}

- (void)imageButtonTouchCancel{
    NSLog(@"Drag Cancel");
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