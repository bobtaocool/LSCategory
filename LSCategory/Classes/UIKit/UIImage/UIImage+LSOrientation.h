//
//  UIImage+LSOrientation.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  修正图片方向

#import <UIKit/UIKit.h>

@interface UIImage (LSOrientation)

/**
 修正图片方向
 @return 修正方向后的图片
 */
- (UIImage *)ls_fixOrientation;

/**
 修正图片方向
 @param srcImg 修正的图片
 @return 修正方向后的图片
 */
+ (UIImage *)ls_fixOrientation:(UIImage *)srcImg;

/**
 垂直翻转
 @return 修正方向后的图片
 */
- (UIImage *)ls_flipVertical;

/**
 水平翻转
 @return 翻转后的图片
 */
- (UIImage *)ls_flipHorizontal;

/** 将图片旋转degrees角度 */
- (UIImage *)ls_imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)ls_imageRotatedByRadians:(CGFloat)radians;

@end
