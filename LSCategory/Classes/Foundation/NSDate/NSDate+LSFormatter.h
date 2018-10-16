//
//  NSDate+Formatter.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 日期格式
 */
typedef NS_ENUM(NSInteger, LSDateFormat) {
    LSYYMMDDHHMMSS,//yyyy-MM-dd HH:mm:ss
    LSYYMMDDHHMM,  //yyyy-MM-dd HH:mm
    LSYYMMDD,      //yyyy-MM-dd
    LSHHMMSS,      //HH:mm:ss
};
@interface NSDate (LSFormatter)

/**
 NSDate转字符串
 @param date 日期
 @param format 日期格式
 @return 日期字符串
 */
+ (NSString *)ls_stringWithDate:(NSDate *)date format:(LSDateFormat)format;

/**
 NSDate转字符串
 @param format 日期格式
 @return 日期字符串
 */
- (NSString *)ls_stringWithDateFormat:(LSDateFormat)format;

/**
 字符串转NSDate
 @param string 字符串
 @param format 日期格式
 @return 日期
 */
+ (NSDate *)ls_dateWithString:(NSString *)string format:(LSDateFormat)format;

/**
 今日
 @return 日期:yyyy-MM-dd
 */
+ (NSString *)ls_Totay;

/**
 当前时间
 @return 时间字符串:yyyy-MM-dd HH:mm:ss
 */
+ (NSString *)ls_CurrentTime;

/**
 当前时间
 @param format 时间格式
 @return 时间字符串
 */
+ (NSString *)ls_CurrentTimeWithFormat:(LSDateFormat)format;


/**
 获取当前时间毫秒时间戳
 @return 时间戳字符串
 */
+ (NSString *)ls_CurrentTimestamp;

/**
 明天
 @param format 时间格式
 @return 时间字符串
 */
+ (NSString *)ls_TomorrowWithFormat:(LSDateFormat)format;

/**
 昨天
 @param format 时间格式
 @return 时间字符串
 */
+ (NSString *)ls_YesterdayWithFormat:(LSDateFormat)format;


@end
