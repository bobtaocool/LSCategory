//
//  UITextField+LSSelect.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (LSSelect)

/**
 当前选中的字符串范围
 @return NSRange
 */
- (NSRange)ls_selectedRange;

/**
 选中所有文字
 */
- (void)ls_selectAllText;

/**
 选中指定范围的文字
 @param range NSRange范围
 */
- (void)ls_setSelectedRange:(NSRange)range;

@end
