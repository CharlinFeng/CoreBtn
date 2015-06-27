//
//  CAAnimation+CoreBtnExtend.m
//  CoreBtn
//
//  Created by 成林 on 15/4/19.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "CAAnimation+CoreBtnExtend.h"

@implementation CAAnimation (CoreBtnExtend)


/**
 *  摇动动画
 *
 *  @return 动画对象
 */
+(CAKeyframeAnimation *)shake{
    
    CAKeyframeAnimation *kfa=[CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    //值
    CGFloat angle = 16;
    kfa.values=@[@(angle),@(0),@(-angle*.9),@(0),@(angle*.8),@(0),@(-angle*.7),@(0),@(angle*.55),@(0),@(-angle*.45),@(0),@(-angle*.35),@(0),@(angle*.2),@(0),@(-angle*.15),@(0),@(-angle*.1),@(0)];
    
    //设置时间
    kfa.duration=1.f;
    
    //是否反转
    kfa.autoreverses=NO;
    
    //曲线
    kfa.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    //完成移除
    kfa.removedOnCompletion=YES;
    
    return kfa;
}






@end
