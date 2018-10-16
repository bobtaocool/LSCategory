//
//  UIWindow+LSHierarchy.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/29.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "UIWindow+LSHierarchy.h"

@implementation UIWindow (LSHierarchy)

- (UIViewController*)ls_topMostController
{
    UIViewController *topController = [self rootViewController];
  
    while ([topController presentedViewController])    topController = [topController presentedViewController];
    
    return topController;
}

- (UIViewController*)ls_currentViewController
{
    UIViewController *currentViewController = [self ls_topMostController];
    
    while ([currentViewController isKindOfClass:[UINavigationController class]] && [(UINavigationController*)currentViewController topViewController])
        currentViewController = [(UINavigationController*)currentViewController topViewController];
    
    return currentViewController;
}

@end
