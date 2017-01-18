//
//  CustomPopAnimation.m
//  Football_talk_iphone
//
//  Created by Aone on 16/6/26.
//  Copyright © 2016年 Aone. All rights reserved.
//

#import "CustomPopAnimation.h"
#import "PopBaseHeader.h"

@implementation CustomPopAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //添加toView到上下文
    [[transitionContext containerView] insertSubview:toViewController.view belowSubview:fromViewController.view];
    
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    NSNumber *width = [user objectForKey:@"Width"];
    NSNumber *height = [user objectForKey:@"Height"];
    
    //自定义动画
    [toViewController.view.subviews objectAtIndex:0].layer.frame = CGRectMake(-width.floatValue, [toViewController.view.subviews objectAtIndex:0].frame.origin.y, width.floatValue, height.floatValue-32*kScreenScale);

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        [fromViewController.view.subviews objectAtIndex:0].layer.frame = CGRectMake(width.floatValue, [toViewController.view.subviews objectAtIndex:0].frame.origin.y, 0, height.floatValue-32*kScreenScale);
        
        [toViewController.view.subviews objectAtIndex:0].layer.frame = CGRectMake(0, [toViewController.view.subviews objectAtIndex:0].frame.origin.y, width.floatValue, height.floatValue-32*kScreenScale);
        
        [toViewController.view.subviews objectAtIndex:0].transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        [fromViewController.view.subviews objectAtIndex:0].transform = CGAffineTransformIdentity;
        
        // 声明过渡结束时调用 completeTransition: 这个方法
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        
    }];
}

@end
