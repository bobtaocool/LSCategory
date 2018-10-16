//
//  UIView+LSFind.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LSFind)

/**
 找到当前view所在的viewcontroler
 */
@property (readonly) UIViewController *ls_viewController;

/**
 找到第一响应着
 @return 第一响应者
 */
- (UIView *)ls_findFirstResponder;

/**
 找到指定类名的SubVie对象
 @param clazz SubVie类名
 @return view对象
 */
- (id)ls_findSubViewWithSubViewClass:(Class)clazz;

/**
 找到指定类名的SuperView对象
 @param clazz SuperView类名
 @return view对象
 */
- (id)ls_findSuperViewWithSuperViewClass:(Class)clazz;

/**
 移除所有子视图
 */
- (void)ls_removeAllSubviews;

@end
