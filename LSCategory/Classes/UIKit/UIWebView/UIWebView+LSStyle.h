//
//  UIWebView+LSStyle.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/11.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWebView (LSStyle)

/**
 是否显示阴影

 @param hidden 是否显示阴影
 */
- (void)ls_shadowViewHidden:(BOOL)hidden;

/**
 是否显示水平滑动指示器

 @param hidden 是否显示水平滑动指示器
 */
- (void)ls_showsHorizontalScrollIndicator:(BOOL)hidden;

/**
 是否显示垂直滑动指示器

 @param hidden 是否显示垂直滑动指示器
 */
- (void)ls_showsVerticalScrollIndicator:(BOOL)hidden;

/**
 网页透明
 */
-(void)ls_makeTransparent;

/**
 网页透明移除+阴影
 */
-(void)ls_makeTransparentAndRemoveShadow;

@end
