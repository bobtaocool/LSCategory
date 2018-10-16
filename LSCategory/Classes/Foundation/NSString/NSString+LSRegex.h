//
//  NSString+LSRegex.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//  正则表达式,用于输入控制，判断是否符合

#import <Foundation/Foundation.h>

@interface NSString (LSRegex)

/**
 字母
 */
- (BOOL)ls_isAlphabet;

/**
 字符和数字
 */
- (BOOL)ls_alphabetAndNumber;

/**
 整型
 */
- (BOOL)ls_isInteger;

/**
 浮点型
 */
- (BOOL)ls_isFloat;

/**
 数字
 */
- (BOOL)ls_isNumber;

/**
 手机号有效性
 */
- (BOOL)ls_isMobileNumber;

/**
 座机号码有效性
 */
- (BOOL)ls_isPhoneNumber;

/**
 邮箱的有效性
 */
- (BOOL)ls_isEmailAddress;

/**
 qq
 */
- (BOOL)ls_isQQ;

/**
 纯汉字
 */
- (BOOL)ls_isValidChinese;

/**
 条码
 */
- (BOOL)ls_isBarcode;

/**
 是否含有表情符号
 */
- (BOOL)ls_isContainsEmoji;

/**
 是否为yyyy-MM-dd格式日期
 */
- (BOOL)ls_isDateFormatter;

@end
