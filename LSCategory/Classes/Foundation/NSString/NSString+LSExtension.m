//
//  NSString+LSExtension.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSString+LSExtension.h"
@implementation NSString (LSExtension)

- (NSDictionary *)ls_dictionary {
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if(error) {
        return nil;
    }
    return dic;
}

+ (BOOL)ls_isNull:(NSString *)string
{
    string = [self ls_trimmingSpace:string];
    if ([string isEqualToString:@""] || string == nil || [string isKindOfClass:[NSNull class]] || [string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)ls_trimmingSpace:(NSString *)string
{
    return  [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)ls_stringByTrim
{
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

- (BOOL)ls_containsString:(NSString *)string {
    if (string == nil) return NO;
    return [self rangeOfString:string].location != NSNotFound;
}

- (BOOL)ls_containsCharacterSet:(NSCharacterSet *)set {
    if (set == nil) return NO;
    return [self rangeOfCharacterFromSet:set].location != NSNotFound;
}


@end
