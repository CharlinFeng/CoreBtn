//
//  CoreCountBtn.h
//  CoreBtn
//
//  Created by 成林 on 15/4/19.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//  倒计时专用btn

#import "CoreBtn.h"

typedef enum{
    
    /** 普通状态 */
    CoreCountBtnStatusNormal=0,
    
    /** 计数状态 */
    CoreCountBtnStatusCounting,
    
    
}CoreCountBtnStatus;


@interface CoreCountBtn : CoreBtn


/** 最大计数值 */
@property (nonatomic,assign) NSUInteger countNum;


/** 状态 */
@property (nonatomic,assign) CoreCountBtnStatus status;


@end
