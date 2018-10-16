//
//  UIImage+LSResize.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  图片调整,剪裁

#import <UIKit/UIKit.h>

@interface UIImage (LSResize)

/**
 按照尺寸剪裁图片
 @param size 剪裁图片的尺寸
 @return image
 */
- (UIImage *)ls_imageScaledToSize:(CGSize)size;

/**
 按照原图尺寸比例剪裁图片
 @param size 剪裁图片的尺寸
 @return image
 */
- (UIImage *)ls_imageScaledToFitSize:(CGSize)size;

/**
 根据裁剪的最大宽度裁剪图片
 @param widthMax 裁剪的最大宽度
 @return image
 */
- (UIImage *)ls_scaleWithWidth:(CGFloat)widthMax;

/**
 根据裁剪的最大高度裁剪图片
 @param HeightMax 裁剪的最大高度
 @return iamge
 */
- (UIImage *)ls_scaleWithHeight:(CGFloat)HeightMax;

/**
 按照原图尺寸，拉伸图片
 @param size 拉伸图片的比例
 @return image
 */
- (UIImage *)ls_imageScaledToFillSize:(CGSize)size;

/**
 压缩图片
 @param maxLength 图片压缩后的最大文件大小，传入单位为Bytes
 @return image
 */
- (UIImage *)ls_compressToByte:(NSUInteger)maxLength;


/** 截取当前image对象rect区域内的图像 */
- (UIImage *)ls_subImageWithRect:(CGRect)rect;

/** 压缩图片至指定像素 */
- (UIImage *)ls_rescaleImageToPX:(CGFloat )toPX;

@end
