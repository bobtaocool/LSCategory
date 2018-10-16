//
//  UIColor+LSAdd.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  生成颜色方法

#import <UIKit/UIKit.h>

@interface UIColor (LSAdd)

/**
 根据16进制获取颜色
 @param hex 16进展字符 例如:0xdf443b
 */
+ (UIColor *)ls_colorWithHex:(UInt32)hex;

/**
 根据16进制获取颜色
 @param hex 16进制字符 例如:0xdf443b
 @param alpha 透明度
 */
+ (UIColor *)ls_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

/**
 根据16进制字符串获取颜色
 @param hexString 16进制字符串 例如：@"df443b",@"#df443b"
 */
+ (UIColor *)ls_colorWithHexString:(NSString *)hexString;

/**
 根据RGB来获取颜色
 RGB值不需要除以255.0
 @param red R
 @param green G
 @param blue B
 @param alpha 透明度
 */
+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue
                            alpha:(CGFloat)alpha;

/**
 根据RGB来获取颜色
 RGB值不需要除以255.0
 @param red R
 @param green G
 @param blue B
 */
+ (UIColor *)ls_colorWithWholeRed:(CGFloat)red
                            green:(CGFloat)green
                             blue:(CGFloat)blue;

/**
 随机色
 */
+ (UIColor *)ls_randomColor;
@end
