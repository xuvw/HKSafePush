//
//  UINavigationController+HKExts.h
//  SageNavigation
//
//  Created by heke on 27/1/16.
//  Copyright © 2016年 mhk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (HKExts)

- (BOOL)canPushViewController:(UIViewController *)vc;
- (BOOL)canPopViewController:(UIViewController *)vc;

@end
