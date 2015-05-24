//
//  UIView+CoreBtnExtend.m
//  CoreBtn
//
//  Created by 成林 on 15/4/19.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "UIView+CoreBtnExtend.h"

@implementation UIView (CoreBtnExtend)



/*
 *  给指定view添加一个和父控件一样大的约束
 */
-(void)constraintAdd{
    
    if(self.superview == nil) return;
    
    self.translatesAutoresizingMaskIntoConstraints=NO;
    
    __weak UIView *view = self;
    
    NSDictionary *views=NSDictionaryOfVariableBindings(view);
    
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:views]];
    [view.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:views]];
}


@end
