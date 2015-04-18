//
//  AnimForCoreBtn.m
//  CoreBtn
//
//  Created by 沐汐 on 15-3-2.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "AnimForCoreBtn.h"

@implementation AnimForCoreBtn

/**
 *  摇动动画
 *
 *  @return 动画对象
 */
+(CAKeyframeAnimation *)shake{
    
    CAKeyframeAnimation *kfa=[CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    
    //值
    CGFloat angle = .16f;
    kfa.values=@[@(angle),@(0),@(-angle),@(0),@(angle),@(0),@(-angle)];
    
    //设置时间
    kfa.duration=0.1f;
    
    //是否重复
    kfa.repeatCount=4.0f;
    
    //是否反转
    kfa.autoreverses=YES;
    
    //完成移除
    kfa.removedOnCompletion=YES;
    
    return kfa;
}







@end
