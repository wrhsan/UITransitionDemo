//
//  SecondViewController.m
//  CustomInteractiveTransition
//
//  Created by 王瑞华 on 16/8/30.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomInteractiveTransition.h"
#import "CustomDissmissAnimation.h"

@interface SecondViewController () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) CustomInteractiveTransition *interactiveAnimator;

@property (nonatomic, strong) CustomDissmissAnimation *dismissAnimator;

@end

@implementation SecondViewController

- (instancetype)init {
    if (self = [super init]) {
        self.transitioningDelegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"dismiss" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.interactiveAnimator = [[CustomInteractiveTransition alloc] initWithViewController:self];
    
    self.dismissAnimator = [[CustomDissmissAnimation alloc] init];
    
    UIPanGestureRecognizer *panGestureRecognizer =[[UIPanGestureRecognizer alloc] initWithTarget:self.interactiveAnimator action:@selector(panGestureAction:)];
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    [self.transitionCoordinator notifyWhenInteractionEndsUsingBlock:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        UIView *view = [context viewForKey:UITransitionContextFromViewKey];
        view.transform = CGAffineTransformMakeScale(0.7, 0.7);
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        UIView *view = [context viewForKey:UITransitionContextFromViewKey];
//        view.transform = CGAffineTransformIdentity;
    }];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        UIView *view = [context viewForKey:UITransitionContextToViewKey];
        view.transform = CGAffineTransformMakeScale(1, 1);
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//        UIView *view = [context viewForKey:UITransitionContextToViewKey];
//        view.transform = CGAffineTransformIdentity;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    self.interactiveAnimator = nil;
    self.dismissAnimator = nil;
}

- (void)btnClick:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.dismissAnimator;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id<UIViewControllerAnimatedTransitioning>)animator {
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    // 如果直接返回 interactive 会与系统的 dismiss 动画有冲突，导致点击 button 无法 dismiss 界面。
    // 同时如果返回  interactiveAnimator，那么 animationControllerForDismissedController: 则必须实现
    return self.interactiveAnimator.isInteractive? self.interactiveAnimator: nil;
//    return self.interactiveAnimator;
}

@end
