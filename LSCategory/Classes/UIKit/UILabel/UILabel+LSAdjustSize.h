//
//  UILabel+LSAdjustSize.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (LSAdjustSize)

/**
 字体适应宽度
 @param scale 取0-1，最小字体的尺寸的倍数
 */
- (void)ls_setAdjustsFontSizeToFitWidthByMinimumScale:(CGFloat)scale;
    
@end
