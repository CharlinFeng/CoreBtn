//
//  ViewController.m
//  CoreBtn
//
//  Created by 沐汐 on 15-3-2.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "ViewController.h"
#import "CoreStatusBtn.h"

@interface ViewController ()

@property (nonatomic,strong) CoreStatusBtn *btn;

@property (weak, nonatomic) IBOutlet CoreStatusBtn *myBtn;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //代码
    
    CoreStatusBtn *btn=[[CoreStatusBtn alloc] initWithFrame:CGRectMake(50, 110, 160, 40)];
    btn.msg=@"登陆中";
    
    //设置文字
    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
    
    btn.backgroundColorForNormal=[UIColor brownColor];
    btn.backgroundColorForHighlighted=[UIColor redColor];
    btn.backgroundColorForSelected=[UIColor yellowColor];
    self.btn=btn;
    
    //添加事件
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
   
    [self.view addSubview:btn];
    

    //nib
    self.myBtn.backgroundColorForNormal=rgb(121, 36, 98);
}


-(IBAction)btnClick:(CoreStatusBtn *)btn{
    
    NSLog(@"事件来了：%@",btn);
    
    btn.status=CoreStatusBtnStatusProgress;

    //子线程测试
    dispatch_queue_t queue=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), queue, ^{
        NSLog(@"当前线程:%@",[NSThread currentThread]);
        btn.status=CoreStatusBtnStatusFalse;
    });
}



@end
