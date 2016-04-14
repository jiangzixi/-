//
//  BTN1ViewController.m
//  阿啪啪面试题
//
//  Created by 姜梓烯 on 16/2/20.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "BTN1ViewController.h"

@interface BTN1ViewController ()

@end

@implementation BTN1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //    分组管理子线程，所有线程执行结束之后汇总
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        sleep(1);
        NSLog(@"111");
    });
    dispatch_group_async(group, queue, ^{
        sleep(2);
        NSLog(@"222");
    });
    dispatch_group_async(group, queue, ^{
        sleep(3);
        NSLog(@"333");
    });
    dispatch_group_async(group, queue, ^{
        sleep(4);
        NSLog(@"444");
    });
    dispatch_group_async(group, queue, ^{
        sleep(5);
        NSLog(@"555");
    });
    dispatch_group_notify(group, queue, ^{
        dispatch_group_async(group, queue, ^{
            sleep(1);
            NSLog(@"111");
        });
        dispatch_group_async(group, queue, ^{
            sleep(2);
            NSLog(@"222");
        });
        dispatch_group_async(group, queue, ^{
            sleep(3);
            NSLog(@"333");
        });
        dispatch_group_async(group, queue, ^{
            sleep(4);
            NSLog(@"444");
        });
        dispatch_group_async(group, queue, ^{
            sleep(5);
            NSLog(@"555");
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
