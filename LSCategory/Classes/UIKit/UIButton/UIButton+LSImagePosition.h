//
//  UIButton+LSImagePosition.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//  设置按钮中图片，文字位置

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, LSImagePosition) {
    LSImagePositionLeft = 0,              //图片在左，文字在右，默认
    LSImagePositionRight = 1,             //图片在右，文字在左
    LSImagePositionTop = 2,               //图片在上，文字在下
    LSImagePositionBottom = 3,            //图片在下，文字在上
};

@interface UIButton (LSImagePosition)

/**
  利用UIButton的titleEdgeInsets和imageEdgeInsets来实现文字和图片的自由排列
   注意：这个方法需要在设置图片和文字之后才可以调用，且button的大小要大于 图片大小+文字大小+spacing
 @param postion 位置
 @param spacing 图片和文字的间隔
 */
- (void)ls_setImagePosition:(LSImagePosition)postion spacing:(CGFloat)spacing;

@end
