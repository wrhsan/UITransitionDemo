//
//  CustomInteractiveTransition.h
//  CustomInteractiveTransition
//
//  Created by 王瑞华 on 16/8/30.
//  Copyright © 2016年 王瑞华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomInteractiveTransition : UIPercentDrivenInteractiveTransition

@property (nonatomic, assign, readonly) BOOL isInteractive;

- (instancetype)initWithViewController:(UIViewController *)viewController;

- (void)panGestureAction:(UIPanGestureRecognizer *)gestureRecognizer;

@end
