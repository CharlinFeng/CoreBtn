//
//  BaseBtn.m
//  Drivers
//
//  Created by muxi on 15/2/6.
//  Copyright (c) 2015年 muxi. All rights reserved.
//

#import "CoreBtn.h"
#import "UIImage+btnColor.h"

@interface CoreBtn ()

/** 原图片 */
@property (nonatomic,weak) UIImage *originalImage;


@end


@implementation CoreBtn


/** 所有事件 */
-(void)Click:(UIControlEvents)event ClickBlock:(void (^)())ClickBlock{
    _ClickBlock = ClickBlock;
    [self addTarget:self action:@selector(btnClick) forControlEvents:event];
    
}


/** 最常见事件 */
-(void)setClickBlock:(void (^)())ClickBlock{
    
    _ClickBlock = ClickBlock;
    
    [self Click:UIControlEventTouchUpInside ClickBlock:ClickBlock];
}


-(void)btnClick{
    if(_ClickBlock != nil) _ClickBlock();
}



/** 图片着色 */

/** 普通情况 */
-(void)setColorForNormal:(UIColor *)colorForNormal{
    if(self.originalImage == nil) return;
    [self setImage:[self.originalImage imageWithTintColor:colorForNormal] forState:UIControlStateNormal];
}

/** 高亮 */
-(void)setColorForHighlighted:(UIColor *)colorForHighlighted{
    if(self.originalImage == nil) return;
    [self setImage:[self.originalImage imageWithTintColor:colorForHighlighted] forState:UIControlStateHighlighted];
}

/** 禁用 */
-(void)setColorForDisabled:(UIColor *)colorForDisabled{
    if(self.originalImage == nil) return;
    [self setImage:[self.originalImage imageWithTintColor:colorForDisabled] forState:UIControlStateDisabled];
}

/** 选中 */
-(void)setColorForSelected:(UIColor *)colorForSelected{
    if(self.originalImage == nil) return;
    [self setImage:[self.originalImage imageWithTintColor:colorForSelected] forState:UIControlStateSelected];
}






/** 背景色 */
#pragma mark  普通状态
-(void)setBackgroundColorForNormal:(UIColor *)backgroundColorForNormal{
    
    _backgroundColorForNormal=backgroundColorForNormal;
    [self setBackgroundImage:[UIImage imageFromContextWithColor:backgroundColorForNormal] forState:UIControlStateNormal];
    if(_backgroundColorForDisabled==nil) self.backgroundColorForDisabled=backgroundColorForNormal;
}


#pragma mark  高亮状态
-(void)setBackgroundColorForHighlighted:(UIColor *)backgroundColorForHighlighted{
    _backgroundColorForHighlighted=backgroundColorForHighlighted;
    [self setBackgroundImage:[UIImage imageFromContextWithColor:backgroundColorForHighlighted] forState:UIControlStateHighlighted];
}



#pragma mark  选中状态
-(void)setBackgroundColorForSelected:(UIColor *)backgroundColorForSelected{
    _backgroundColorForSelected=backgroundColorForSelected;
    [self setBackgroundImage:[UIImage imageFromContextWithColor:backgroundColorForSelected] forState:UIControlStateSelected];
}


#pragma mark  不可用状态
-(void)setBackgroundColorForDisabled:(UIColor *)backgroundColorForDisabled{
    _backgroundColorForDisabled=backgroundColorForDisabled;
    [self setBackgroundImage:[UIImage imageFromContextWithColor:backgroundColorForDisabled] forState:UIControlStateDisabled];
}



#pragma mark  字体大小
-(void)setFontPoint:(CGFloat)fontPoint{
    _fontPoint=fontPoint;
    self.titleLabel.font=[UIFont systemFontOfSize:fontPoint];
}



/** 原图 */
-(UIImage *)originalImage{
    
    if(_originalImage == nil){
        _originalImage = [self imageForState:UIControlStateNormal];
    }
    
    return _originalImage;
}






@end
