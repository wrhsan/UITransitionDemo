//
//  ViewController.m
//  CustomInteractiveTransition
//
//  Created by 王瑞华 on 16/8/30.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"present" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)btnClick:(UIButton *)sender {
    SecondViewController *secVC = [[SecondViewController alloc] init];
    [self presentViewController:secVC animated:YES completion:nil];
}

- (void)secondViewControllerDismiss {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
