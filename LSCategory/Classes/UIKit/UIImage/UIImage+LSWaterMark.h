//
//  UIImage+LSWaterMark.h
//  LSaleClothingForIpad
//
//  Created by 陶冬波 on 2018/7/16.
//  Copyright © 2018年 Salewell. All rights reserved.
//  图片加水印

#import <UIKit/UIKit.h>

@interface UIImage (LSWaterMark)

/**
 *  给图片加文字水印
 *
 *  @param str     水印文字
 *  @param strRect 文字所在的位置大小
 *  @param attri   文字的相关属性，自行设置
 *
 *  @return 加完水印文字的图片
 */
- (UIImage*)ls_imageWaterMarkWithString:(NSString*)str rect:(CGRect)strRect attribute:(NSDictionary *)attri;
/**
 *  给图片加文字水印
 *
 *  @param str      水印文字
 *  @param strPoint 文字（0，0）点所在位置
 *  @param attri    文字的相关属性，自行设置
 *
 *  @return 加完水印文字的图片
 */
- (UIImage*)ls_imageWaterMarkWithString:(NSString*)str point:(CGPoint)strPoint attribute:(NSDictionary*)attri;



@end
