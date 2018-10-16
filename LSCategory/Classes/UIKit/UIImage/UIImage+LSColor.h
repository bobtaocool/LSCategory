//
//  UIImage+LSColor.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  根据颜色获得图片

#import <UIKit/UIKit.h>

@interface UIImage (LSColor)

/**
 根据颜色生成纯色图片
 @param color 颜色
 @return image
 */
+ (UIImage *)ls_imageWithColor:(UIColor *)color;

/**
 将图片转换为黑白图片
 @return image
 */
- (UIImage *)ls_blackAndWhiteImage;

/** 取图片某一像素的颜色 */
- (UIColor *)ls_colorAtPixel:(CGPoint)point;

/** 获得灰度图 */
- (UIImage *)ls_convertToGrayImage;

@end
