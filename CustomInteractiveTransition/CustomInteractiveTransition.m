//
//  CustomInteractiveTransition.m
//  CustomInteractiveTransition
//
//  Created by 王瑞华 on 16/8/30.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import "CustomInteractiveTransition.h"

@interface CustomInteractiveTransition ()

@property (nonatomic, weak) UIViewController *viewController;

@property (nonatomic, assign) CGFloat startScale;

@property (nonatomic, assign, readwrite) BOOL isInteractive;

@end

@implementation CustomInteractiveTransition

- (instancetype)initWithViewController:(UIViewController *)viewController {
    if (self = [super init]) {
        _isInteractive = NO;
        _viewController = viewController;
    }
    return self;
}

- (void)panGestureAction:(UIPanGestureRecognizer *)recognizer {
    CGFloat progress = [recognizer translationInView:self.viewController.view].y / (self.viewController.view.bounds.size.height * 1.0);
    progress = MIN(1.0, MAX(0.0, progress));
    
    self.isInteractive = YES;
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        [self.viewController dismissViewControllerAnimated:YES completion:^{
            
        }];
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        [self updateInteractiveTransition:progress];
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) {
        if (progress > 0.5) {
            [self finishInteractiveTransition];
        }
        else {
            [self cancelInteractiveTransition];
        }
        
        self.isInteractive = NO;
    }
}

@end
