//
//  CustomDismissAnimator.m
//  TransitionCustom
//
//  Created by 王瑞华 on 16/1/26.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "CustomPopAnimation.h"

@implementation CustomPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController *firstVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    firstVC.view.frame = [UIScreen mainScreen].bounds;
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    UIView *containerView  = [transitionContext containerView];
    
    [containerView addSubview:firstVC.view];
    [containerView addSubview:secondVC.view];
    
    [UIView animateWithDuration:duration animations:^{
        secondVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, secondVC.view.bounds.size.width, secondVC.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
