//
//  UIView+LSFrame.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/26.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (LSFrame)

@property (nonatomic, assign) CGPoint origin;///< 快捷方式 frame.origin.
@property (nonatomic, assign) CGSize size;///< 快捷方式 frame.size.

@property (nonatomic, assign) CGFloat centerX;///< 快捷方式 center.x
@property (nonatomic, assign) CGFloat centerY;///< 快捷方式 center.y


@property (nonatomic, assign) CGFloat top; ///< 快捷方式 frame.origin.y
@property (nonatomic, assign) CGFloat bottom;///< 快捷方式 frame.origin.y + frame.size.height
@property (nonatomic, assign) CGFloat right; ///< 快捷方式 frame.origin.x + frame.size.width
@property (nonatomic, assign) CGFloat left;///< 快捷方式 frame.origin.x.

@property (nonatomic, assign) CGFloat width;///< 快捷方式 frame.size.width.
@property (nonatomic, assign) CGFloat height;///< 快捷方式 frame.size.height.

@end
