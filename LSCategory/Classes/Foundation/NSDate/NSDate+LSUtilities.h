//
//  NSDate+LSUtilities.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSUtilities)

@property (nonatomic, readonly) NSInteger year; //年
@property (nonatomic, readonly) NSInteger month; //月(1~12)
@property (nonatomic, readonly) NSInteger day; //日(1~31)
@property (nonatomic, readonly) NSInteger hour; //小时(0~23)
@property (nonatomic, readonly) NSInteger minute; //分(0~59)
@property (nonatomic, readonly) NSInteger second; //秒(0~59)
@property (nonatomic, readonly) NSInteger nanosecond; //纳秒
@property (nonatomic, readonly) NSInteger weekday; ///星期(1~7)

#pragma mark ---- Adjusting dates 调节时间

/**
 返回numYears年后的日期
 @param years 年
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingYears:(NSInteger)years;

/**
 返回months月后的日期
 @param months 月
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingMonths:(NSInteger)months;

/**
 返回weeks周后的日期
 @param weeks 星期
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingWeeks:(NSInteger)weeks;

/**
 返回days天后的日期
 @param days 天
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingDays:(NSInteger)days;

/**
 返回hours小时后的日期
 @param hours 小时
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingHours:(NSInteger)hours;

/**
 返回minutes分后的日期
 @param minutes 分
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingMinutes:(NSInteger)minutes;

/**
 返回seconds秒后的日期
 @param seconds 秒
 @return 日期
 */
- (nullable NSDate *)ls_dateByAddingSeconds:(NSInteger)seconds;

@end
