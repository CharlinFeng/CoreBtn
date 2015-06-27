//
//  CoreCountBtn.m
//  CoreBtn
//
//  Created by 成林 on 15/4/19.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "CoreCountBtn.h"
#import "UIView+CoreBtnExtend.h"



@interface CoreCountBtn ()


/** 标题文字 */
@property (nonatomic,copy) NSString *titleStr;

/** 计数标签 */
@property (nonatomic,strong) UILabel *countLabel;

/** 原本的计数 */
@property (nonatomic,assign) NSUInteger originalCountNum;


@end



@implementation CoreCountBtn

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //初始化
        [self countBtnPrepare];
    }
    
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //初始化
        [self countBtnPrepare];
    }
    
    return self;
}


/*
 *  初始化
 */
-(void)countBtnPrepare{
    
    //默认配置
    self.countNum = 60;
    self.status = CoreCountBtnStatusNormal;
    
    
}


-(void)setStatus:(CoreCountBtnStatus)status{
    
    if(_status == status) return;
    
    _status = status;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        if(CoreCountBtnStatusNormal == status){//普通状态
            
            [self statusNormal];
            
        }else{//计数状态
            
            [self statusCounting];
            
        }
    });
}



/*
 *  普通状态
 */
-(void)statusNormal{
    
    //启用
    self.enabled = YES;
    
    [self.countLabel removeFromSuperview];
}



/*
 *  计数状态
 */
-(void)statusCounting{
    
    //禁用
    self.enabled = NO;
    
    [self addSubview:self.countLabel];
    
    [self.countLabel constraintAdd];
    
    //计数恢复最大
    _countNum = _originalCountNum;
    
    //开始计数
    [self counting];
}


/*
 *  开始计数
 */
-(void)counting{
    
    if(_countNum<=0){
        
        self.status = CoreCountBtnStatusNormal;
        return;
    }
    

    self.countLabel.text = [NSString stringWithFormat:@"%@ 秒",@(_countNum--)];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.2f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self counting];
    });
}






-(UILabel *)countLabel{
    
    if(_countLabel==nil){
        
        _countLabel = [[UILabel alloc] init];
        
        //居中
        _countLabel.textAlignment=NSTextAlignmentCenter;
        
        //文本颜色
        _countLabel.textColor=self.currentTitleColor;
        
        //字体大小
        _countLabel.font=self.titleLabel.font;
        
        //背景色
        _countLabel.backgroundColor = self.backgroundColorForNormal;
    }
    
    return _countLabel;
}



-(void)setBackgroundColorForNormal:(UIColor *)backgroundColorForNormal{
    
    [super setBackgroundColorForNormal:backgroundColorForNormal];
    
    self.backgroundColorForHighlighted = backgroundColorForNormal;
    
    self.backgroundColorForDisabled = backgroundColorForNormal;
}

-(void)setCountNum:(NSUInteger)countNum{
    
    _countNum = countNum;
    
    self.originalCountNum = countNum;
}


-(void)dealloc{

    self.countLabel=nil;
}

@end
