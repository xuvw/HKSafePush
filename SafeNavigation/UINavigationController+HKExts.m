//
//  UINavigationController+HKExts.m
//  SageNavigation
//
//  Created by heke on 27/1/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "UINavigationController+HKExts.h"
#import <objc/runtime.h>
#import "UIViewController+HKSafeExts.h"

@implementation UINavigationController (HKExts)

+ (void)load {
    Method orign = class_getInstanceMethod([self class], @selector(pushViewController:animated:));
    Method dest  =  class_getInstanceMethod([self class], @selector(hk_pushViewController:animated:));
    
    method_exchangeImplementations(orign, dest);
}

- (void)hk_pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (![self canPushViewController:viewController]) {
        return;
    }
    [self hk_pushViewController:viewController animated:animated];
}

- (BOOL)canPushViewController:(UIViewController *)vc {
    UIViewController *topVC = [self.viewControllers lastObject];
    if (topVC && topVC.hk_Pushing) {
        NSLog(@"last push going, this push will be ignored...");
        return NO;
    }
    
    vc.hk_Pushing = YES;
    return YES;
}

- (BOOL)canPopViewController:(UIViewController *)vc {
    return YES;
}

@end
