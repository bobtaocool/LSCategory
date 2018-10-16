//
//  UIButton+LSClickEdgeInsets.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/5.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 改变按钮的响应区域 */
@interface UIButton (LSClickEdgeInsets)

/**
 设置按钮额外点击区域 上左下右分别增加或减小多少  正数为增加 负数为减小
 */
@property (nonatomic, assign) UIEdgeInsets ls_touchAreaInsets;

@end
