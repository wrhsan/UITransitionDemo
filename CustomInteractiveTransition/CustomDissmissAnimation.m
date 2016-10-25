//
//  CustomDissmissAnimation.m
//  CustomInteractiveTransition
//
//  Created by 王瑞华 on 16/8/30.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "CustomDissmissAnimation.h"

@implementation CustomDissmissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIViewController *srcVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *secondVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:srcVC.view];
    
    [containerView addSubview:secondVC.view];

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        secondVC.view.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, secondVC.view.bounds.size.width, secondVC.view.bounds.size.height);
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
