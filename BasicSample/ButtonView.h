//
//  ButtonView.h
//  BasicSample
//
//  Created by chenkai on 15/1/29.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonView : UIView

/**
 *  UIButton继承制UIControl,UIControl继承值UIView 
 *  Button控件所有具有很多View的特性， 同理UIDatePicker,UIPageControl,UITextField,UISlider,UISwith等控件均继承UIView
 */
@property (nonatomic,retain) UIButton *controlBut;


/**
 *  Define UIButton按钮
 */
@property (nonatomic,retain) UIButton *imageBut;

@end