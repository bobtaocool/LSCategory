//
//  NSNumber+LSRound.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/7/4.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSNumber+LSRound.h"

@implementation NSNumber (LSRound)

#pragma mark - Display
- (NSString*)ls_toDisplayNumberWithDigit:(NSInteger)digit andRoundingMode:(NSNumberFormatterRoundingMode)Mode
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:Mode];
    [formatter setMaximumFractionDigits:digit];
    result = [formatter  stringFromNumber:self];
    if (result == nil)
        return @"";
    return result;
    
}

+ (NSString*)ls_toDisplayString:(NSString*)string WithDigit:(NSInteger)digit andRoundingMode:(NSNumberFormatterRoundingMode)Mode
{
    NSString *result = nil;
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSNumber *numTemp = [numberFormatter numberFromString:string];
    NSLog(@"numberFormatter=%@",numTemp);
    if (numTemp != nil) {
        [numberFormatter setRoundingMode:Mode];
        [numberFormatter setMaximumFractionDigits:digit];
        result = [numberFormatter  stringFromNumber:numTemp];
        NSLog(@"numberFormatter =%@",result);
    }
    
    if (result == nil)
        return @"";
    return result;
}

+ (NSNumber*)ls_numberFromString:(NSString*)string
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    NSNumber *numTemp = [numberFormatter numberFromString:string];
    return numTemp;
}

- (NSString*)ls_toDisplayPercentageWithDigit:(NSInteger)digit andRoundingMode:(NSNumberFormatterRoundingMode)Mode
{
    NSString *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setNumberStyle:NSNumberFormatterPercentStyle];
    [formatter setRoundingMode:Mode];
    [formatter setMaximumFractionDigits:digit];
    result = [formatter  stringFromNumber:self];
    return result;
}

#pragma mark - ceil , round, floor

- (NSNumber*)ls_doRoundWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundHalfUp];
    [formatter setMaximumFractionDigits:digit];
    [formatter setMinimumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber*)ls_doCeilWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundCeiling];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}

- (NSNumber*)ls_doFloorWithDigit:(NSUInteger)digit
{
    NSNumber *result = nil;
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    [formatter setRoundingMode:NSNumberFormatterRoundFloor];
    [formatter setMaximumFractionDigits:digit];
    result = [NSNumber numberWithDouble:[[formatter  stringFromNumber:self] doubleValue]];
    return result;
}
@end
