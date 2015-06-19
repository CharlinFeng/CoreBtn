//
//  BaseBtn.h
//  Drivers
//
//  Created by muxi on 15/2/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//  自定义的按钮
//  此按钮可以设置不同状态下的背景色

#import <UIKit/UIKit.h>

#define rgb(r,g,b) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1.0f]

@interface CoreBtn : UIButton

//普通状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForNormal;

//高亮状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForHighlighted;

//不可用状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForDisabled;

//被选中状态下的颜色
@property (nonatomic,strong) UIColor *backgroundColorForSelected;

/** 图片着色:普通 */
@property (nonatomic,strong) UIColor *colorForNormal;

/** 图片着色:高亮 */
@property (nonatomic,strong) UIColor *colorForHighlighted;

/** 图片着色:禁用 */
@property (nonatomic,strong) UIColor *colorForDisabled;

/** 图片着色:选中 */
@property (nonatomic,strong) UIColor *colorForSelected;

/** 字体大小 */
@property (nonatomic,assign) CGFloat fontPoint;

/** 最常用的点击事件 */
@property (nonatomic,copy) void (^ClickBlock)();

/** 事件 */
-(void)Click:(UIControlEvents)event ClickBlock:(void(^)())ClickBlock;

@end
