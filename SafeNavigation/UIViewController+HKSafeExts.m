//
//  UIViewController+HKSageExts.m
//  SageNavigation
//
//  Created by heke on 28/1/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import "UIViewController+HKSafeExts.h"
#import <objc/runtime.h>

@implementation UIViewController (HKSafeExts)

+ (void)load {
    Method origin = class_getInstanceMethod([self class], @selector(viewDidAppear:));
    Method dest   = class_getInstanceMethod([self class], @selector(hk_viewDidAppear:));
    method_exchangeImplementations(origin, dest);
    
    origin = class_getInstanceMethod([self class], @selector(viewWillAppear:));
    dest   = class_getInstanceMethod([self class], @selector(hk_viewWillAppear:));
    method_exchangeImplementations(origin, dest);
}

- (void)setHk_Pushing:(BOOL)hk_Pushing {
    objc_setAssociatedObject(self, _cmd, [NSNumber numberWithBool:hk_Pushing], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (BOOL)hk_Pushing {
    NSNumber *n = objc_getAssociatedObject(self, @selector(setHk_Pushing:));
    if (n) {
        return n.boolValue;
    }else{
        return NO;
    }
}

- (void)hk_viewWillAppear:(BOOL)animated {
    [self hk_viewWillAppear:animated];
    [self hk_disableNavigationBar];
}

- (void)hk_viewDidAppear:(BOOL)animated {
    [self hk_viewDidAppear:animated];
    self.hk_Pushing = NO;
    [self hk_enableNavigationBar];
}

- (void)hk_enableNavigationBar {
    if (self.navigationController) {
        if (!self.navigationController.navigationBar) return;
        self.navigationController.navigationBar.userInteractionEnabled = YES;
    }
}

- (void)hk_disableNavigationBar {
    if (self.navigationController) {
        if (!self.navigationController.navigationBar) return;
        self.navigationController.navigationBar.userInteractionEnabled = NO;
    }
}

@end
