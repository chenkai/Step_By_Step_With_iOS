//
//  CommonControlViewController.m
//  BasicSample
//
//  Created by chenkai on 15/1/20.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "CommonControlViewController.h"
#import "LableView.h"
#import "ButtonView.h"

@interface CommonControlViewController()

@property (nonatomic,retain) UIAlertView *basicAlertView;

@end

@implementation CommonControlViewController

- (instancetype)init{
    self = [super init];
    if (self) {
        [self initUIElement];
    }
    return self;
}

- (void)viewDidLoad{
    
}

- (void)initUIElement{
    //AlertView Button
    self.alterViewBut = [[UIButton alloc] initWithFrame:CGRectMake(50, 80, 280, 45)];
    [self.alterViewBut setTitle:@"AlertView" forState:UIControlStateNormal];
    [self.alterViewBut setBackgroundColor:[UIColor grayColor]];
    [self.alterViewBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.alterViewBut addTarget:self action:@selector(displayAlterView) forControlEvents:UIControlEventTouchDown];
    self.basicView = [[UIView alloc] init];
    [self.basicView addSubview:self.alterViewBut];
    
    //UILable Button
    self.labelViewBut = [[UIButton alloc] initWithFrame:CGRectMake(50, 130, 280, 45)];
    [self.labelViewBut setTitle:@"UILabel" forState:UIControlStateNormal];
    [self.labelViewBut setBackgroundColor:[UIColor grayColor]];
    [self.labelViewBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.labelViewBut addTarget:self action:@selector(displayUILabelView) forControlEvents:UIControlEventTouchDown];
    [self.basicView addSubview:self.labelViewBut];
    
    //UIButtonView Button
    self.buttonViewBut = [[UIButton alloc] initWithFrame:CGRectMake(50,180, 280, 45)];
    [self.buttonViewBut setTitle:@"UIButton" forState:UIControlStateNormal];
    [self.buttonViewBut setBackgroundColor:[UIColor grayColor]];
    
    [self.buttonViewBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.buttonViewBut addTarget:self action:@selector(displayButtonView) forControlEvents:UIControlEventTouchDown];
    [self.basicView addSubview:self.buttonViewBut];
    self.view = self.basicView;
}

- (void)displayUILabelView{
    LableView *labelView = [[LableView alloc] init];
    self.view = labelView;
}

- (void)displayButtonView{
    ButtonView *butView = [[ButtonView alloc] init];
    self.view = butView;
}

#pragma mark UIAlertView Call Function [Start:2015年01月20日 - End:2015年01月21日]

-(void)displayAlterView{
    self.basicAlertView = [[UIAlertView alloc] initWithTitle:@"Tips"
                                                     message:@"Want to join us?"
                                                    delegate:self
                                           cancelButtonTitle:@"Join"
                                           otherButtonTitles:@"No",@"Cancel One",@"Password Style", nil];//Button can add more
    
    //View Style
    //self.basicAlertView.alertViewStyle = UIAlertViewStyleDefault;//Default Value
    //self.basicAlertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;//Login And Password Input
    //self.basicAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;//Plain Text Input
    //self.basicAlertView.alertViewStyle = UIAlertViewStyleSecureTextInput;//Password TextInput
   
    
    //Title And Message
    //self.basicAlertView.title = @"Change Title";
    //self.basicAlertView.message = @"Change Message";
    
    //Tag属性继承至UIView 当一个View具有多个AlertView对象用来区别标识
    self.basicAlertView.tag = 1;
    NSLog(@"Element Tag值是:%ld",(long)self.basicAlertView.tag);
    
    //是否可见
    NSLog(@"AlertView是否可见?%d",self.basicAlertView.visible);
    if (self.basicAlertView.visible) {
        NSLog(@"当前AlertView可见");
    }else{
        NSLog(@"当前AlertView不可见");
    }
    
    //添加按钮并指定标题
    [self.basicAlertView addButtonWithTitle:@"Add Button With Title"];
    
    //按钮总数
    NSLog(@"AlertView按钮总数:%ld",(long)self.basicAlertView.numberOfButtons);
    
    //获取索引的按钮标题
    NSLog(@"第一个按钮的标题是:%@",[self.basicAlertView buttonTitleAtIndex:1]);
    
    //获取取消按钮的索引
    NSLog(@"取消按钮的索引是:%ld",self.basicAlertView.cancelButtonIndex);
    
    //获取第一个其他按钮的索引
    NSLog(@"第一个其他按钮的索引是:%ld",self.basicAlertView.firstOtherButtonIndex);
    
    //定制AlertView 视图
    //[self customerAlertView];
    
    //AlertView 所有文本左对齐
    [self changeAlertViewTextToLeft];
    
    [self.basicAlertView show];
}

-(void)changeAlertViewTextToLeft{
    //Use Block
    [self.basicAlertView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel *defLabel = (UILabel *)obj;
            defLabel.textAlignment = NSTextAlignmentLeft;
        }
    }];
    
    //Use Foreach
    for (UIView *defView in self.basicAlertView.subviews) {
        if ([defView isKindOfClass:[UILabel class]]) {
            UILabel *defLable = (UILabel *)defView;
            defLable.textAlignment = NSTextAlignmentLeft;
        }
    }
}

-(void)customerAlertView{
    self.basicAlertView = [[UIAlertView alloc] initWithTitle:@"加载中..."
                                                     message:nil
                                                    delegate:nil
                                           cancelButtonTitle:nil
                                           otherButtonTitles: nil];
    UIActivityIndicatorView *activeView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activeView.center = CGPointMake(self.basicAlertView.bounds.size.width / 2.0f, self.basicAlertView.bounds.size.height - 40.0f);
    [activeView startAnimating];
    [self.basicAlertView addSubview:activeView];//加载动画不显示
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    //当点击CancelButton时 手动取消对话框
    if (buttonIndex == self.basicAlertView.cancelButtonIndex) {
        NSLog(@"Cancel Button Called");
        [self.basicAlertView dismissWithClickedButtonIndex:0 animated:YES];
    }
}

-(void)willPresentAlertView:(UIAlertView *)alertView{
    NSLog(@"Will Present AlertView");
}

-(void)didPresentAlertView:(UIAlertView *)alertView{
    NSLog(@"Did Present AlertView");
}

-(void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"Will Dismiss AlertView");
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex{
    NSLog(@"Did Dismiss AlertView");
}

-(void)alertViewCancel:(UIAlertView *)alertView{
    //这个方法只有System系统dismiss AlertView时才会调用.
    NSLog(@"Cancel Alert View");
}

@end

