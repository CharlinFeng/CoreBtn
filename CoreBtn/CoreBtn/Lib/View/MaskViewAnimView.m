//
//  MaskViewAnimView.m
//  CoreBtn
//
//  Created by 成林 on 15/4/18.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "MaskViewAnimView.h"
#import "UIView+CoreBtnExtend.h"

@implementation MaskViewAnimView






/*
 *  显示
 */
-(void)show:(UIView *)view{
    
    [view insertSubview:self atIndex:0];
    
    //执行一个放大动画
    [self zoomAnim];
}



/*
 *  放大动画
 */
-(void)zoomAnim{
    
    CGFloat scale = 1.12f;
    
    [UIView animateWithDuration:.42f animations:^{
        
        //动画曲线
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        self.transform = CGAffineTransformMakeScale(scale, scale+.12f);
        self.alpha=.0f;
        
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformIdentity;
        self.alpha=1.0f;
        [self removeFromSuperview];
    }];
}







@end
