//
//  UIImage+QRCode.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  创建条码图片

#import <UIKit/UIKit.h>

@interface UIImage (QRCode)

/**
 创建条形码
 @param info 字符串信息
 @return 条形码图片
 */
+ (UIImage *)ls_barCodeImageWithInfo:(NSString *)info;

/**
  创建二维码
  @param info  二维码内的信息
  @param image 二维码中心的logo图片
  @param width 二维码的宽度
  @return 二维码图片
 */
+ (UIImage *)ls_qrCodeImageWithInfo:(NSString *)info centerImage:(UIImage *)image  width:(CGFloat)width;

/**
  将CIImage 放大显示，并转换为UIImage。
  @param image 原始CIImage
  @param size  最终尺寸的宽度
  @return UIImage
 */
+ (UIImage *)ls_createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat)size;

/**
    将原图转变为背景色透明，图片为设置的颜色
    @param image 要改变的图片
    @param red   red
    @param green green
    @param blue  blue
    @return 返回修改后的图片
 */
+ (UIImage*)ls_imageBgColorToTransparentWith:(UIImage*)image withRed:(CGFloat)red andGreen:(CGFloat)green andBlue:(CGFloat)blue;

@end
