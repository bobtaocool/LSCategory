//
//  NSString+LSExtension.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (LSExtension)

/** 字符串转字典 */
- (NSDictionary *)ls_dictionary;

/** 判断是否为空 */
+ (BOOL)ls_isNull:(NSString *)string;

/** 去掉首尾空格（空行和空字）*/
+ (NSString *)ls_trimmingSpace:(NSString *)string;

/** 去掉首尾空格（空行和空字）*/
- (NSString *)ls_stringByTrim;

/**
 是否包含某个字符串
 @param string 字符串
 @return BOOL
 */
- (BOOL)ls_containsString:(NSString *)string;

/**
 是否包含某个字符
 @param set 字符
 @return BOOL
 */
- (BOOL)ls_containsCharacterSet:(NSCharacterSet *)set;

@end
