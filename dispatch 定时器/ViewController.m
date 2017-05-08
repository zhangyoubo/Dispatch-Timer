//
//  ViewController.m
//  dispatch 定时器
//
//  Created by 张友波 on 17/3/20.
//  Copyright © 2017年 张友波. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    dispatch_source_t _timer;
    dispatch_queue_t _queue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    dispatch_resume(_timer);        // 恢复定时器
    
    dispatch_suspend(_timer);       // 暂停定时器
    
    dispatch_source_cancel(_timer); // 取消定时器
}


-(void)setSourceTimer{
    NSTimeInterval period = 0.3; //设置时间间隔
    _queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0); //每0.3秒执行
    dispatch_source_set_event_handler(_timer, ^{
        //在这里执行事件
        NSLog(@"dispatch_source_set_event_handler");
        
    });
    
}


@end
