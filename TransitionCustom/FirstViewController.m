//
//  ViewController.m
//  TransitionCustom
//
//  Created by 王瑞华 on 16/1/26.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "CustomPushAnimation.h"
#import "CustomPopAnimation.h"

@interface FirstViewController () <UIViewControllerTransitioningDelegate>


@property (nonatomic, strong) CustomPushAnimation *pushAnimaiton;
@property (nonatomic, strong) CustomPopAnimation *dismissAnimation;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (IBAction)buttonClick:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    secondVC.transitioningDelegate = self;
//    secondVC.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:secondVC animated:YES completion:^{
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CustomPushAnimation *)pushAnimaiton
{
    if (nil == _pushAnimaiton) {
        _pushAnimaiton = [[CustomPushAnimation alloc] init];
    }
    
    return _pushAnimaiton;
}

- (CustomPopAnimation *)dismissAnimation {
    if (!_dismissAnimation) {
        _dismissAnimation = [[CustomPopAnimation alloc] init];
    }
    return _dismissAnimation;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.pushAnimaiton;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator
{
    return nil;
}

- (void)dealloc
{
    self.pushAnimaiton = nil;
    self.dismissAnimation = nil;
}

@end
