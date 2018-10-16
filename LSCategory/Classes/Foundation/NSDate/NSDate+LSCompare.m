//
//  NSDate+LSCompare.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSDate+LSCompare.h"

@implementation NSDate (LSCompare)

///比较年月日是否相等
- (BOOL)ls_isEqualToDateIgnoringTime:(NSDate *)aDate
{
    return YES;
}
///是否提前aDate
- (BOOL)ls_isEarlierThanDate:(NSDate *)aDate
{
     return ([self compare:aDate] == NSOrderedAscending);
}
///是否晚于aDate
- (BOOL)ls_isLaterThanDate:(NSDate *)aDate
{
     return ([self compare:aDate] == NSOrderedDescending);
}

@end
