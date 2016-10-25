//
//  CustomPresentAnimation.m
//  TransitionCustom
//
//  Created by 王瑞华 on 16/1/26.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
        
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    CGRect toFrame = [transitionContext finalFrameForViewController:toVC];
    
    UIView *containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    
    toVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, toVC.view.frame.size.width, toVC.view.frame.size.height);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
//    [UIView animateWithDuration:duration animations:^{
//        toVC.view.frame = toFrame;
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
//    }];
    
    [UIView animateWithDuration:duration delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
         toVC.view.frame = toFrame;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

@end
