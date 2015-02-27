//
//  CommonControlViewController.h
//  BasicSample
//
//  Created by chenkai on 15/1/20.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonControlViewController : UIViewController<UIAlertViewDelegate>

//UIControls
@property (nonatomic,retain) UIView *basicView;
@property (nonatomic,retain) UIButton *alterViewBut;
@property (nonatomic,retain) UIButton *labelViewBut;
@property (nonatomic,retain) UIButton *buttonViewBut;

//Protocol & Category
@property (nonatomic,retain) UIButton *protocolViewBut;
@property (nonatomic,retain) UIButton *categoryViewBut;

@end
