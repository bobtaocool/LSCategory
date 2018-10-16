//
//  UIWindow+LSHierarchy.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/29.
//  Copyright © 2018年 杨荣. All rights reserved.
//  UIWinodw的层次结构

#import <UIKit/UIKit.h>

@interface UIWindow (LSHierarchy)

/**
  返回最顶层的控制器
 @return UIViewController
 */
- (UIViewController*)ls_topMostController;

/**
 返回当前控制器
 @return UIViewController
 */
- (UIViewController*)ls_currentViewController;

@end
