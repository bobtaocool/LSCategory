//
//  UILabel+LSSpace.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/5.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 设置lable 字间距和行间距 */
@interface UILabel (LSSpace)

/**
 *  设置字间距
 */
- (void)ls_setColumnSpace:(CGFloat)columnSpace;

/**
 *  设置行距
 */
- (void)ls_setRowSpace:(CGFloat)rowSpace;

@end
