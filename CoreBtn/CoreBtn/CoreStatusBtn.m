//
//  CoreStatusBtn.m
//  CoreBtn
//
//  Created by 沐汐 on 15-3-2.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "CoreStatusBtn.h"
#import "CoreStatusBtnMaskView.h"
#import "CAAnimation+CoreBtnExtend.h"

@interface CoreStatusBtn ()


/** 遮罩层 */
@property (nonatomic,strong) CoreStatusBtnMaskView *maskView;

/** 是否高亮中 */
@property (nonatomic,assign) BOOL isHL;

@property (nonatomic,strong) NSTimer *timer;

@end


@implementation CoreStatusBtn


-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if(self){
        
        //按钮准备
        [self btnPrepare];
    }
    
    return self;
}



-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self=[super initWithCoder:aDecoder];
    
    if(self){
        
        //按钮准备
        [self btnPrepare];
    }
    
    return self;
}




/*
 *  按钮准备
 */
-(void)btnPrepare{
    
    self.msg=nil;
    self.clipsToBounds=NO;
}



-(void)setStatus:(CoreStatusBtnStatus)status{
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
        _status=status;
        
        self.enabled=(CoreStatusBtnStatusNormal==status || CoreStatusBtnStatusSuccess==status);
        
        if(status==CoreStatusBtnStatusFalse){
            //执行一个失败动画
            CAKeyframeAnimation *kfa = [CAAnimation shake];
            
            //设置代理
            kfa.delegate=self;
            
            [self.layer addAnimation:kfa forKey:@"shake"];
        }
        
        self.maskView.status=status;
        
        if(self.shutOffColorLoadingAnim) return;
        
        if(CoreStatusBtnStatusProgress == status){
            [self showLoadingStatus];
        }else{
            [self dismissLoadingStatus];
        }
    });
}



-(void)showLoadingStatus{
    
    [self timerOn];
}


-(void)toggleBgColor{
    
    [UIView animateWithDuration:.2 animations:^{
        if(!self.isHL){
            self.maskView.backgroundColor = self.backgroundColorForHighlighted;
        }else{
            self.maskView.backgroundColor = self.backgroundColorForNormal;
        }
    }];
    self.isHL = !self.isHL;
}


-(void)dismissLoadingStatus{
    
    [self timerOff];
    
    self.backgroundColorForNormal = self.backgroundColorForNormal;
}





-(void)setMsg:(NSString *)msg{
    
    _msg=msg;
    
    if(msg==nil) msg=self.currentTitle;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.maskView.msg=msg;
    });
}


-(CoreStatusBtnMaskView *)maskView{
    
    if(_maskView==nil){

        _maskView=[CoreStatusBtnMaskView maskView];
        _maskView.statusBtn=self;
        _maskView.shutOffZoomAnim = self.shutOffZoomAnim;
        [self addSubview:_maskView];
    }
    
    return _maskView;
}


-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.25f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.status=CoreStatusBtnStatusNormal;
    });
}


-(void)timerOn{
    
    if(self.timer != nil) return;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:.25f target:self selector:@selector(toggleBgColor) userInfo:nil repeats:YES];
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

-(void)timerOff{
    
    if(self.timer == nil) return;
    
    [self.timer invalidate];
    
    self.timer = nil;
}

@end
