//
//  ViewController.m
//  阿啪啪面试题
//
//  Created by 姜梓烯 on 16/2/20.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "ViewController.h"
#import "BTN1ViewController.h"
#import "BTN2TableViewController.h"
#import "BTN3ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.translucent = NO;
    
    NSMutableArray *btnName = [NSMutableArray array];
    [btnName addObject:@"10个子线程，先执行前五个，执行完再执行后面的另外五个，怎么实现？"];
    [btnName addObject:@"手势冲突怎么处理？点击手势Tap和Cell的DidSelect冲突，怎么解决？"];
    [btnName addObject:@"使用CABasicAnimation动画结束以后怎么不让他回到初始的位置，让他停在结束的位置？"];
    
    for (int i = 0; i<[btnName count]; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        [button setTitle:btnName[i] forState:UIControlStateNormal];
        button.titleLabel.numberOfLines = 2;
        button.frame = CGRectMake(5, i*50, 370, 50);
        [button setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [button addTarget:self action:@selector(myButton:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = 1000+i;
        [self.view addSubview:button];
    }
}
- (void)myButton:(UIView *)btn {
    switch (btn.tag) {
        case 1000:{
            [self.navigationController pushViewController:[[BTN1ViewController alloc] init] animated:YES];
            break;
        }
        case 1001:{
            [self.navigationController pushViewController:[[BTN2TableViewController alloc] init] animated:YES];
            break;
        }
        case 1002:{
            [self.navigationController pushViewController:[[BTN3ViewController alloc] init] animated:YES];
            break;
        }
        default:
            break;
    }
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
