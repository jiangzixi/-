//
//  BTN3ViewController.m
//  阿啪啪面试题
//
//  Created by 姜梓烯 on 16/2/20.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "BTN3ViewController.h"

@interface BTN3ViewController ()

@property (strong, nonatomic) UIView *ye;
@property (assign, nonatomic) CGRect rect;
@property (assign, nonatomic) BOOL tag;
@property (assign, nonatomic) CGPoint center;

@end

@implementation BTN3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    _ye = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 120, 20)];
    _ye.backgroundColor = [UIColor greenColor];
    _ye.center = self.view.center;
    _center = _ye.center;
    [self.view addSubview:_ye];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 50)];
    label.text = @"touchBegan开始动画";
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    // Do any additional setup after loading the view.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CABasicAnimation *anm = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    
#pragma mark -----关键代码开始
//    anm.removedOnCompletion = NO;
//    anm.fillMode = kCAFillModeForwards;
#pragma mark -----关键代码结束
    
    [anm setDuration:1];
    [anm setRepeatCount:1];
    [anm setDelegate:self];
    [anm setValue:@"旋转动画" forKey:@"xuanzhuan"];
//    anm.fillMode = kCAFillModeRemoved;
    anm.toValue = [NSNumber numberWithFloat:M_PI/2];
    
    [_ye.layer addAnimation:anm forKey:@"ccc"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    if ([[anim valueForKey:@"xuanzhuan"] isEqualToString:@"旋转动画"]) {
        if (!_tag) {
            _ye.frame = CGRectMake(0, 0, 20, 120);
            _ye.center = _center;
        }else{
            _ye.frame = CGRectMake(0, 0, 120, 20);
            _ye.center = _center;
        }
        _tag = !_tag;
    }
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
