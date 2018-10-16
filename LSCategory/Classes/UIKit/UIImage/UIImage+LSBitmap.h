//
//  UIImage+LSBitmap.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//  图片转换点阵图

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,BitPixels) {
    BPAlpha = 0,
    BPBlue = 1,
    BPGreen = 2,
    BPRed = 3
};
@interface UIImage (LSBitmap)

/**
 将图片转换为点阵图数据
 @return 转化后的点阵图数据
 */
- (NSData *)ls_bitmapData;

/**
 将图片绘制到绘图上下文中，并返回上下文
 */
- (CGContextRef)ls_bitmapRGBA8Context;

@end
