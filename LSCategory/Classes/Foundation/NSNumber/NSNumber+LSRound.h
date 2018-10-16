//
//  NSNumber+LSRound.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/4.
//  Copyright © 2018年 杨荣. All rights reserved.
//  小数处理

#import <Foundation/Foundation.h>

@interface NSNumber (LSRound)

#pragma mark - 展示

/**
 小数字符串处理
 例如 NSString *string = @"12345.6789";
 @param string 传入的小数字符串
 @param digit 小数位最大位数  例如:3
 @param Mode Mode
 NSNumberFormatterRoundCeiling 向上取整 例如:12345.679
 NSNumberFormatterRoundFloor 向下取整 例如:12345.678
 NSNumberFormatterRoundHalfUp 四舍五入 例如:12345.679
 @return NSString
 */
+ (NSString*)ls_toDisplayString:(NSString*)string WithDigit:(NSInteger)digit andRoundingMode:(NSNumberFormatterRoundingMode)Mode;

/**
 NSNumber转字符串
 
 例如:NSNumber *number=@(12345.6789);
 @param digit 小数位最大位数  例如:3
 @param Mode
 NSNumberFormatterRoundCeiling 向上取整 例如:12345.679
 NSNumberFormatterRoundFloor 向下取整 例如:12345.678
 NSNumberFormatterRoundHalfUp 四舍五入 例如:12345.679
 @return NSString
 */
- (NSString*)ls_toDisplayNumberWithDigit:(NSInteger)digit andRoundingMode:(NSNumberFormatterRoundingMode)Mode;

/**
 字符串转NSNumber

 @param string 字符串
 @return NSNumber
 */
+ (NSNumber*)ls_numberFromString:(NSString*)string;

#pragma mark - 小数处理方式
/**
 四舍五入

 @param digit 小数位最大位数
 @return 结果
 */
- (NSNumber*)ls_doRoundWithDigit:(NSUInteger)digit;

/**
 向上取整

 @param digit 小数位最大位数
 @return 结果
 */
- (NSNumber*)ls_doCeilWithDigit:(NSUInteger)digit;

/**
 向下取整

 @param digit 小数位最大位数
 @return 结果
 */
- (NSNumber*)ls_doFloorWithDigit:(NSUInteger)digit;

@end
