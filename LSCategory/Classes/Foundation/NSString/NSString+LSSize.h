//
//  NSString+LSSize.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (LSSize)

/**
 *  @brief 计算文字的高度
 *
 *  @param font  字体(默认为系统字体)
 *  @param width 约束宽度
 */
- (CGFloat)ls_heightWithFont:(UIFont *)font width:(CGFloat)width;

/**
 *  @brief 计算文字的宽度
 *
 *  @param font   字体(默认为系统字体)
 *  @param height 约束高度
 */
- (CGFloat)ls_widthWithFont:(UIFont *)font height:(CGFloat)height;

/**
 计算文字的大小

 @param font 字体(默认为系统字体)
 @param size 文字约束的size
 @param lineBreakMode 省略号方式
 @return size
 */
- (CGSize)sizeForFont:(UIFont *)font size:(CGSize)size mode:(NSLineBreakMode)lineBreakMode;


@end
