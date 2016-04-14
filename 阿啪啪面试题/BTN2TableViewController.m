//
//  BTN2TableViewController.m
//  阿啪啪面试题
//
//  Created by 姜梓烯 on 16/2/20.
//  Copyright © 2016年 姜梓烯. All rights reserved.
//

#import "BTN2TableViewController.h"

@interface BTN2TableViewController ()<UIGestureRecognizerDelegate>

@property (strong, nonatomic) NSMutableArray *myArray;
@property (assign, nonatomic) int temp;

@end

@implementation BTN2TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _myArray = [NSMutableArray array];
    for (int i = 0; i<30; i++) {
        [_myArray addObject:[NSString stringWithFormat:@"点我的右下方触发手势"]];
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_myArray count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (cell.tag == 0) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(myTap:)];
        tap.delegate = self;
        [cell addGestureRecognizer:tap];
        cell.tag = _temp;
        _temp++;
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(200, 40, 175, 40)];
        view.backgroundColor = [UIColor redColor];
        [cell addSubview:view];
    }
    cell.textLabel.text = _myArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)myTap:(UIGestureRecognizer *)tap{
    NSLog(@"触发了手势");
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    CGPoint location = [touch locationInView:touch.view.superview];
    if (location.x>200&&location.y>40) {
        return YES;
    }else{
        return NO;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"触发了cell的代理方法");
}
@end
