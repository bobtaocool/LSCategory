//
//  NSDate+Formatter.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/25.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSDate+LSFormatter.h"
#import "NSDate+LSUtilities.h"
@implementation NSDate (LSFormatter)

+ (NSString *)ls_stringWithDate:(NSDate *)date format:(LSDateFormat)format {
    return [date ls_stringWithDateFormat:format];
}

- (NSString *)ls_stringWithDateFormat:(LSDateFormat)format {
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:[NSDate ls_dataFormatToString:format]];
    NSString *retStr = [outputFormatter stringFromDate:self];
    return retStr;
}

+ (NSDate *)ls_dateWithString:(NSString *)string format:(LSDateFormat)format {
    NSDateFormatter *inputFormatter = [[NSDateFormatter alloc] init];
    [inputFormatter setDateFormat:[NSDate ls_dataFormatToString:format]];
    NSDate *date = [inputFormatter dateFromString:string];
    return date;
}

+ (NSString *)ls_Totay
{
    return [NSDate ls_stringWithDate:[NSDate date] format:LSYYMMDD];
}

+ (NSString *)ls_CurrentTime
{
    return [NSDate ls_stringWithDate:[NSDate date] format:LSYYMMDDHHMMSS];
}

+ (NSString *)ls_CurrentTimeWithFormat:(LSDateFormat)format
{
   return [NSDate ls_stringWithDate:[NSDate date] format:format];
}

+ (NSString *)ls_CurrentTimestamp
{
     return  [[NSNumber numberWithLongLong:[[NSDate date] timeIntervalSince1970]*1000] stringValue];
}

+ (NSString *)ls_TomorrowWithFormat:(LSDateFormat)format
{
    NSDate *torromDate = [[NSDate date] ls_dateByAddingDays:1];
    return [NSDate ls_stringWithDate:torromDate format:format];
}

+ (NSString *)ls_YesterdayWithFormat:(LSDateFormat)format
{
    NSDate *torromDate = [[NSDate date] ls_dateByAddingDays:-1];
    return [NSDate ls_stringWithDate:torromDate format:format];
}

+(NSString*)ls_dataFormatToString:(LSDateFormat)format
{
    switch (format) {
        case LSYYMMDDHHMMSS:
        {
            return @"yyyy-MM-dd HH:mm:ss";
        }
            break;
        case LSYYMMDDHHMM:
        {
            return @"yyyy-MM-dd HH:mm";
        }
            break;
        case LSYYMMDD:
        {
            return @"yyyy-MM-dd";
        }
            break;
        case LSHHMMSS:
        {
            return @"HH:mm:ss";
        }
            break;
        
        default:
        {
            return @"yyyy-MM-dd HH:mm:ss";
        }
            break;
    }
    
}

@end
