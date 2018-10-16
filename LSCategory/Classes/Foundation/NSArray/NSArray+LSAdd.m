//
//  NSArray+LSAdd.m
//  LSCategory
//
//  Created by 陶冬波 on 2018/6/27.
//  Copyright © 2018年 杨荣. All rights reserved.
//

#import "NSArray+LSAdd.h"

@implementation NSArray (LSAdd)

- (NSString *)ls_toJSONString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONReadingMutableLeaves | NSJSONReadingAllowFragments error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

- (NSString *)ls_toReadableJSONString
{
    if ([NSJSONSerialization isValidJSONObject:self]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
        NSString *json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        return json;
    }
    return nil;
}

- (NSArray *)ls_reverseArray
{
    NSMutableArray *arrayTemp = [NSMutableArray arrayWithCapacity:[self count]];
    NSEnumerator *enumerator = [self reverseObjectEnumerator];
    for (id element in enumerator) {
        [arrayTemp addObject:element];
    }
    return arrayTemp;
}

-(NSArray*)sortDescriptorWithKeyArry:(NSArray<NSString*>*)keyArry
{
    NSMutableArray * ascs =[NSMutableArray array];
    for (NSString *sortKey in keyArry) {
         NSSortDescriptor *moneyasc = [NSSortDescriptor sortDescriptorWithKey:sortKey ascending:YES];
        [ascs addObject:moneyasc];
    }
    return [self sortedArrayUsingDescriptors:ascs];
}
@end
