//
//  NSDate+LSCompare.h
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LSCompare)

///比较年月日是否相等
- (BOOL)ls_isEqualToDateIgnoringTime:(NSDate *)aDate;
///是否提前aDate
- (BOOL)ls_isEarlierThanDate:(NSDate *)aDate;
///是否晚于aDate
- (BOOL)ls_isLaterThanDate:(NSDate *)aDate;

@end
