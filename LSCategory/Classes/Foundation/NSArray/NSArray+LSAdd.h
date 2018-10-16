//
//  NSArray+LSAdd.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (LSAdd)

/**
  转换成JSON串字符串（没有可读性）

 @return JSON字符串
 */
- (NSString *)ls_toJSONString;

/**
 转换成JSON串字符串（有可读性）

 @return JSON字符串
 */
- (NSString *)ls_toReadableJSONString;

/**
 数组倒序

 @return NSArray
 */
- (NSArray *)ls_reverseArray;

/**
 自定义类，按照某个属性排序

 @param keyArry 属性数组
 @return NSArray
 */
-(NSArray*)sortDescriptorWithKeyArry:(NSArray*)keyArry;


@end
