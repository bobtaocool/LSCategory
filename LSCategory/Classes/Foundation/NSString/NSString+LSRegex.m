//
//  NSString+LSRegex.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/22.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSString+LSRegex.h"

@implementation NSString (LSRegex)

#pragma mark - 正则相关
- (BOOL)ls_isValidateByRegex:(NSString *)regex{
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    return [pre evaluateWithObject:self];
}

- (BOOL)ls_isAlphabet
{
    NSString *alphabetRegex = @"^[A-Za-z]+$";
    return [self ls_isValidateByRegex:alphabetRegex];
}

- (BOOL)ls_alphabetAndNumber
{
    NSString *alphabetAndNumberRegex = @"“^[A-Za-z0-9]+$”";
    return [self ls_isValidateByRegex:alphabetAndNumberRegex];
}

- (BOOL)ls_isInteger
{
    NSString *integerRegex = @"^-?\\d+$";
    return [self ls_isValidateByRegex:integerRegex];
}

- (BOOL)ls_isFloat
{
    NSString *floatRegex = @" ^(-?\\d+)(\\.\\d+)?$";
    return [self ls_isValidateByRegex:floatRegex];
}

- (BOOL)ls_isNumber
{
    NSString *numberRegex = @"^[0-9]*$";
    return [self ls_isValidateByRegex:numberRegex];
}

- (BOOL)ls_isMobileNumber
{
    NSString *mobileRegex = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    return [self ls_isValidateByRegex:mobileRegex];
    
}

- (BOOL)ls_isPhoneNumber
{
    NSString *phoneRegex = @"((\\d{3,4})|\\d{3,4}-|\\s)?\\d{7,8}";
    return [self ls_isValidateByRegex:phoneRegex];
}

- (BOOL)ls_isEmailAddress
{
    NSString *emailRegex = @"^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$";
    return [self ls_isValidateByRegex:emailRegex];
}

- (BOOL)ls_isQQ
{
    NSString *qqRegex = @"^[1-9][0-9]\{4,}";
    return [self ls_isValidateByRegex:qqRegex];
}

- (BOOL)ls_isValidChinese
{
    NSString *chineseRegex = @"^[\u4e00-\u9fa5]{0,}$";
    return [self ls_isValidateByRegex:chineseRegex];
}

- (BOOL)ls_isBarcode
{
    NSString *barcodeRegex = @"^[1-9]{11}$";
    return [self ls_isValidateByRegex:barcodeRegex];
}

- (BOOL)ls_isContainsEmoji
{
    __block BOOL returnValue = NO;
    
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByComposedCharacterSequences usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop)
     {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
         } else {
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}

- (BOOL)ls_isDateFormatter
{
    NSString *dateRegex = @"^[0-9]{4}-(((0[13578]|(10|12))-(0[1-9]|[1-2][0-9]|3[0-1]))|(02-(0[1-9]|[1-2][0-9]))|((0[469]|11)-(0[1-9]|[1-2][0-9]|30)))$";
    return [self ls_isValidateByRegex:dateRegex];
}
@end
