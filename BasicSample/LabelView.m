//
//  LabelView.m
//  BasicSample
//
//  Created by chenkai on 15/1/21.
//  Copyright (c) 2015年 chenkai. All rights reserved.
//

#import "LableView.h"

@implementation LableView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self initUILableElement];
    }
    return self;
}

-(void)initUILableElement{
    self.defLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 80, 250, 45)];
    self.defLabel.backgroundColor = [UIColor grayColor];
    self.defLabel.textColor = [UIColor whiteColor];
    self.defLabel.text = @"Living In BeiJing";
    
    //字体
    self.defLabel.textAlignment = NSTextAlignmentCenter;
    self.defLabel.font = [UIFont systemFontOfSize:16];//系统字体设置
    self.defLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:16];//自定义字体
    self.defLabel.font = [UIFont boldSystemFontOfSize:16];//字体加粗
    
    //阴影
    self.defLabel.shadowColor = [UIColor colorWithWhite:0.8f alpha:0.8f];//设置文本阴影颜色和透明度
    self.defLabel.shadowColor = [UIColor redColor];//直接设置颜色
    self.defLabel.shadowOffset = CGSizeMake(2.0f, 2.0f);//阴影倾斜角度
    
    //换行
    self.defLabel.text = @"Mark Living In BeiJing Three Years";
    self.defLabel.lineBreakMode = NSLineBreakByWordWrapping;//换行模式
    self.defLabel.numberOfLines = 2;//最多显示的换行总数 如果是0 标示多行
    
    //高亮
    //self.defLabel.highlighted = YES;
    //self.defLabel.highlightedTextColor = [UIColor orangeColor];
    
    //自动收缩 [Autoshrink]
    self.defLabel.adjustsFontSizeToFitWidth = YES;
    
    //换行模式 NSLineBreakMode 换行枚举共6
    //NSLineBreakByWordWrapping = 0,     	/* Wrap at word boundaries, default */
    //NSLineBreakByCharWrapping,		/* Wrap at character boundaries */
    //NSLineBreakByClipping,		/* Simply clip */
    //NSLineBreakByTruncatingHead,	/* Truncate at head of line: "...wxyz" */
    //NSLineBreakByTruncatingTail,	/* Truncate at tail of line: "abcd..." */
    //NSLineBreakByTruncatingMiddle	/* Truncate middle of line:  "ab...yz" */
    
    self.defLabel.text = @"You Have Long Long A Way To GreatThings Will be "; //Coming you See hahahahhhahahahah
    self.defLabel.lineBreakMode = NSLineBreakByWordWrapping;//以单词为显示单位显示，后面部分省略不显示
    self.defLabel.lineBreakMode = NSLineBreakByCharWrapping;//以字符为显示单位显示，后面部分省略不显示
    self.defLabel.lineBreakMode = NSLineBreakByClipping;//剪切与文本宽度相同的内容长度，后半部分被删除
    self.defLabel.lineBreakMode = NSLineBreakByTruncatingHead;//前面部分文字以……方式省略，显示尾部文字内容
    self.defLabel.lineBreakMode = NSLineBreakByTruncatingMiddle;//中间的内容以……方式省略，显示头尾的文字内容
    self.defLabel.lineBreakMode = NSLineBreakByTruncatingTail;//结尾部分的内容以……方式省略，显示头的文字内容
    
    //旋转
    self.defLabel.transform = CGAffineTransformMakeRotation(0.1);//旋转角度 [旋转方向默认是顺时针方向]
    
    //设置字体大小适应Label宽度
    self.defLabel.adjustsFontSizeToFitWidth = YES;//内容越多字体越小 [适应显示效果.]
    
    //文本基线位置 [当adjustsFontSizeToFitWidth = YES 时生效]
    //UIBaselineAdjustmentAlignBaselines = 0,默认，文本最上端与中线对齐。
    //UIBaselineAdjustmentAlignCenters,  文本中线与label中线对齐。
    //UIBaselineAdjustmentNone, 文本最低端与label中线对齐。
    self.defLabel.baselineAdjustment = UIBaselineAdjustmentAlignCenters;
    self.defLabel.baselineAdjustment = UIBaselineAdjustmentAlignBaselines;
    self.defLabel.baselineAdjustment = UIBaselineAdjustmentNone;
    
    //文本边框
    self.defLabel.layer.borderColor = [[UIColor blueColor] CGColor];
    self.defLabel.layer.borderWidth = 2;
    
    //设置标签属性文本 [同一个文本里多个不同颜色值]
    NSString *operatorStr = @"Control String With Bonder";
    
    [self addSubview:self.defLabel];
}

-(void)setAttributeText{
 
}

@end
