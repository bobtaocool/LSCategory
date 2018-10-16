//
//  UIView+LSAddLine.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/28.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    LSBorderTypeTop,
    LSBorderTypeLeft,
    LSBorderTypeRight,
    LSBorderTypeBottom
} LSBorderType;

@interface UIView (LSAddLine)


/**
 UIView画直线
 @param startPoint 开始点
 @param endPoint 结束点
 @param color 线的颜色
 @param lineWidth 线的宽度
 */
- (void)ls_drawLineStartPoint:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint color:(UIColor *)color andLineWidth:(CGFloat)lineWidth;

/**
 UIView加边框
 @param color 边框颜色
 @param size 边框尺寸
 @param types 画边框的数组 举例：如果画上边框和右边框 types = @ [@(LSBorderTypeTop),@(LSBorderTypeRight)]
 */
- (void)ls_addBorderWithColor:(UIColor *)color size:(CGFloat)size borderTypes:(NSArray *)types;

/**
  UIView加边框
 @param color 边框颜色
 @param size 边框尺寸
 @param boderType 边框枚举
 */
- (void)ls_addBorderLayerWithColor:(UIColor *)color size:(CGFloat)size borderType:(LSBorderType)boderType;


/**
 UIView加四周边框
 @param color 边框颜色
 @param lineWidth 边框宽度
 */
-(void)ls_addBoarderWithColor:(UIColor *)color andLineWidth:(CGFloat)lineWidth;

/**
 设置圆角
 
 @param corners 枚举
 UIRectCornerTopLeft     = 1 << 0,
 UIRectCornerTopRight    = 1 << 1,
 UIRectCornerBottomLeft  = 1 << 2,
 UIRectCornerBottomRight = 1 << 3,
 UIRectCornerAllCorners  = ~0UL
 @param radius 弧度
 */
-(void)ls_setRoundedCorners:(UIRectCorner)corners
                     radius:(CGFloat)radius;

@end
