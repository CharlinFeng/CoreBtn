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




/*
 *  转场动画
 */
+(CATransition *)transition{
    
    CATransition *transition=[CATransition animation];
    
    //动画时长
    transition.duration=1.f;
    
    transition.type=[self animaType];
    
//    NSUInteger subIndex=i%4;
    
    //设置转场动画的方向
    NSArray *subtypes=@[kCATransitionFromTop,kCATransitionFromLeft,kCATransitionFromBottom,kCATransitionFromRight];
    transition.subtype=subtypes[0];
    
    //时间函数
//    NSUInteger timingFunctionIndex=i%5;
    NSArray *funcNames=@[kCAMediaTimingFunctionDefault,kCAMediaTimingFunctionEaseIn,kCAMediaTimingFunctionEaseInEaseOut,kCAMediaTimingFunctionEaseOut,kCAMediaTimingFunctionLinear];
    transition.timingFunction=[CAMediaTimingFunction functionWithName:funcNames[2]];
    
    //动画完成删除
    transition.removedOnCompletion=YES;
    
    return transition;
}



+(NSString *)animaType{
    
    //设置转场动画的类型
    NSArray *animArray=@[@"rippleEffect",@"suckEffect",@"pageCurl",@"oglFlip",@"cube",@"reveal",@"pageUnCurl"];
//    NSUInteger i=arc4random_uniform(animArray.count);
    
    return animArray[4];
}



@end
